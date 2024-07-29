#[starknet::contract]
mod counter_contract {
    #[storage]
    struct Storage {
        counter: u32
    }

    #[constructor]
    fn constructor(ref self: ContractState, initial_counter: u32) {
        self.counter.write(initial_counter);
    }
}