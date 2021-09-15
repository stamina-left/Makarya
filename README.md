#  Architecture Design

### Settings Entity

| **Attributes** | **Type** |
| ----------- | ----------- |
| duration | Time |
| sound | Asset |

### Timer Entity

| **Attributes** | **Type** |
| ----------- | ----------- |
| id | Identifier<Time> |
| date | Timestamp |
| duration | Time |
| passed | Time |

### Asset Value Object

| **Attributes** | **Type** |
| ----------- | ----------- |
| path | String |

### Timestamp Value Object

| **Attributes** | **Type** |
| ----------- | ----------- |
| day | Day |
| month | MonthsOfTheYear |
| year | Int |

### Day Value Object

| **Attributes** | **Type** |
| ----------- | ----------- |
| name | DaysOfTheWeek |
| date | Int |

### DaysOfTheWeek Enum

| **Attributes** |
| ----------- |
| Sunday |
| Monday |
| Tuesday |
| Wednesday |
| Thursday |
| Friday |
| Saturday |

### MonthsOfTheYear Enum

| **Attributes** |
| ----------- |
| January |
| February |
| March |
| April |
| May |
| June |
| July |
| August |
| September |
| October |
| November |
| December |

### Time Value Object

| **Attributes** | **Type** |
| ----------- | ----------- |
| hours | Int |
| minutes | Int |
| second | Int |
| millisecond | Int |

## Given-When-Then & Contract-Driven Development

I’m combining Behavior Driven Development’s technique called Given-When-Then (GWT) and Contract Driven Development’s technique to list a feature and reduce confusion when developing or writing an acceptance test. Here’s what we need write in order:

1. Story: What the user wants to. For example: “As a … I want to …”.
2. Scenario: What the user going to do to get what they want.
3. Business rules: For deciding whether the user may or may not get what they want.
4. Given: What is the context of the system? What pre-condition must be true before the action is tested? What data is in the system?
5. When: What will be tested? What input data will be tested via the business rule when the action occurs?
6. Then: In response to the action, what is the observable outcome? What are the expected results? What is the post-condition (state) or output data observable by the user?

### New User Scenario

| **Story** | As a new user, I want to start a timer. |
| **Scenario** | The new user starts a timer with default settings. |
| **Business rule** | The default settings are 30 minutes timer and alarm clock sound. |
| ***Given*** | --- |
| precondition(s) | Timer.date = nil; Timer.duration = nil; Timer.passed = nil; |
| fixed data | Settings.duration = Time(0, 30, 0, 0); Settings.sound = Asset.path(“alarm”); |
| ***When*** | --- |
| Action | New user start a timer with default settings and finish the timer. |
| Input data | Timer.duration = Time(0, 30, 0, 0); |
| ***Then*** | --- |
| output data | Your 30 minutes timer ends. |
| postcondition | Timer.date = Calendar.current; Timer.passed = Time(0, 30, 0, 0); |

### Old User Scenario

| **Story** | As a user, I want to finish a timer with desired settings. |
| **Scenario** | The user wants to finish one-hour timer and Neon sound. |
| **Business rule** | Changed settings will be saved when the user starts a timer. |
| ***Given*** | --- |
| precondition(s) | Timer.date = nil; Timer.duration = nil; Timer.passed = nil;  |
| fixed data | Settings.duration = Time(0, 30, 0, 0); Settings.sound = Asset.path(“alarm”); |
| ***When*** | --- |
| Action | Start 1 hour timer with neon sound. |
| Input data | Settings.duration = Time(1, 0, 0, 0); Settings.sound = Asset.path(“neon”); Timer.duration = Time(1, 0, 0, 0); |
| ***Then*** | --- |
| output data | Your one hour timer ends. |
| postcondition | Timer.date = Calendar.current; Timer.passed = Time(1, 0, 0, 0); Settings.duration = Time(1, 0, 0, 0); Settings.sound = Asset.path(“neon”); |
