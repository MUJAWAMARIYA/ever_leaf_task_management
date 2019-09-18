**table**
column| :data_type
|---: | : ---|
|id| :integer|
|name| :string|
|email| :varcharacter|
|password | :varcharacter|
|title| :string|

**task table**
column| :data_type
|---: | : --- |
|id(fk)| :integer|
|name| :string|
|start_date| :date|
| end_date| :date|
|status| :string|
|priority| :string|

**Label table**
column| :data_type
|---: | : --- |
|user_id| :integer|
|task_id| :integer|