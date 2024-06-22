module algorithm

    implicit none
    private
    public :: algorithm_with_nested_function

    abstract interface

    subroutine OBJ()
    end subroutine OBJ

    end interface
    
    contains
    
    subroutine algorithm_with_nested_function(objective_function)
        procedure(OBJ) :: objective_function
        call evaluate(nested_function)

        contains
        
        subroutine nested_function()
            call objective_function()
        end subroutine nested_function
    
    end subroutine algorithm_with_nested_function

    subroutine evaluate(a_nested_function)
        procedure(OBJ) :: a_nested_function
        call a_nested_function()
    end subroutine evaluate
    
    
    end module algorithm
