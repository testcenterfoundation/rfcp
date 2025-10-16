| Argument          | Syntax    | Kind                                    | Can be used as | Notes                        |
| ----------------- | --------- | --------------------------------------- | -------------- | ---------------------------- |
| `${name}`         | Mandatory | Positional or Named                     | Positional/Nam | Must be provided             |
| `${age}`          | Mandatory | Positional or Named                     | Positional/Nam | Must be provided             |
| `@{hobbies}`      | Optional  | Variable Number of Positional Arguments | Positional     | 0 or more values             |
| `${city}=Unknown` | Optional  | Named-Only                              | Named          | Must be passed by name       |
| `&{extra}`        | Optional  | Free Named Arguments                    | Named          | Catches unmatched named args |
