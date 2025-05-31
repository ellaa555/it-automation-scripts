# Generate two random numbers between 1 and 10
$num1 = Get-Random -Minimum 1 -Maximum 11
$num2 = Get-Random -Minimum 1 -Maximum 11

# Choose a random operator
$operators = @('+', '-', '*', '/')
$operator = $operators | Get-Random

# Calculate the result based on the operator
switch ($operator) {
    '+' { $result = $num1 + $num2 }
    '-' { $result = $num1 - $num2 }
    '*' { $result = $num1 * $num2 }
    '/' { 
        if ($num2 -ne 0) {
            $result = [math]::Round($num1 / $num2, 2) 
        }
        else {
            $result = "undefined (division by zero)"
        }
    }
}

# Output the equation and the result
Write-Host "$num1 $operator $num2 = $result"
