%lang starknet

from starkware.cairo.common.cairo_builtins import HashBuiltin
from starkware.starknet.common.syscalls import get_caller_address

# A map from user (represented by account contract address)
# to their balance.
@storage_var
func balance(user : felt) -> (res : felt):
end

# Increases the balance of the user by the given amount.
@external
func increase_balance{
    syscall_ptr : felt*,
    pedersen_ptr : HashBuiltin*,
    range_check_ptr
}(amount : felt):

    # Obtain the address of the account contract.
    let (user) = get_caller_address()

    # Read and update its balance.
    let (res) = balance.read(user=user)
    balance.write(user, res + amount)
    return ()

end

@external
func decrease_balance{
    syscall_ptr : felt*,
    pedersen_ptr : HashBuiltin*,
    range_check_ptr
}(amount : felt):

    # Obtain the address of the account contract.
    let (user) = get_caller_address()

    # Read and update its balance.
    let (res) = balance.read(user=user)
    balance.write(user, res - amount)

    return ()

end

# Returns the balance of the given user.
@view
func get_balance{
    syscall_ptr : felt*,
    pedersen_ptr : HashBuiltin*,
    range_check_ptr
}(user: felt) -> (res : felt):
    let (res) = balance.read(user=user)
    return (res)
end

@view
func get_one{
    syscall_ptr : felt*,
    pedersen_ptr : HashBuiltin*,
    range_check_ptr
}(data: felt) -> (res: felt):
    return (data + 100)
end

