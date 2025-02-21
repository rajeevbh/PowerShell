# PowerShell Collections

| Collection Type  | Description | Example |
|------------------|-------------|---------|
| **Array (`@()`)** | Ordered collection of items | `$arr = @(1, 2, 3, 4)` |
| **ArrayList (`System.Collections.ArrayList`)** | Resizable array with better performance for modifications | `$arrList = New-Object System.Collections.ArrayList; $arrList.Add(5)` |
| **List (`System.Collections.Generic.List[T]`)** | Strongly typed, resizable list | `$list = New-Object 'System.Collections.Generic.List[int]'; $list.Add(10)` |
| **Hashtable (`@{}`)** | Key-value pair collection | `$hash = @{Name='John'; Age=30}` |
| **Dictionary (`System.Collections.Generic.Dictionary[TKey,TValue]`)** | Strongly typed key-value pair collection | `$dict = New-Object 'System.Collections.Generic.Dictionary[string,int]'; $dict.Add("Key", 100)` |
| **Queue (`System.Collections.Queue`)** | FIFO (First-In-First-Out) collection | `$queue = New-Object System.Collections.Queue; $queue.Enqueue("Task1")` |
| **Stack (`System.Collections.Stack`)** | LIFO (Last-In-First-Out) collection | `$stack = New-Object System.Collections.Stack; $stack.Push("Item1")` |

