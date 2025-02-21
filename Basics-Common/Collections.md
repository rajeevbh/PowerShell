# PowerShell Collections

| Collection Type  | Description | Example | When to Use |
|------------------|-------------|---------|-------------|
| **Array (`@()`)** | Ordered collection of items | `$arr = @(1, 2, 3, 4)` | Use when the size is fixed and operations are minimal. |
| **ArrayList (`System.Collections.ArrayList`)** | Resizable array with better performance for modifications | `$arrList = New-Object System.Collections.ArrayList; $arrList.Add(5)` | Use when frequent insertions and deletions are required. |
| **List (`System.Collections.Generic.List[T]`)** | Strongly typed, resizable list | `$list = New-Object 'System.Collections.Generic.List[int]'; $list.Add(10)` | Use when type safety and performance are priorities. |
| **Hashtable (`@{}`)** | Key-value pair collection | `$hash = @{Name='John'; Age=30}` | Use when fast lookups with unique keys are needed. |
| **Dictionary (`System.Collections.Generic.Dictionary[TKey,TValue]`)** | Strongly typed key-value pair collection | `$dict = New-Object 'System.Collections.Generic.Dictionary[string,int]'; $dict.Add("Key", 100)` | Use when type safety is required along with fast key-based lookups. |
| **Queue (`System.Collections.Queue`)** | FIFO (First-In-First-Out) collection | `$queue = New-Object System.Collections.Queue; $queue.Enqueue("Task1")` | Use when processing elements in the order they arrive. |
| **Stack (`System.Collections.Stack`)** | LIFO (Last-In-First-Out) collection | `$stack = New-Object System.Collections.Stack; $stack.Push("Item1")` | Use when processing elements in reverse order of arrival. |

