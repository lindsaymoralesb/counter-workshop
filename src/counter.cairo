#[starknet::interface]
pub trait ICounter<T> {
    fn get_counter(self: @T) -> u32;
}

#[starknet::contract]
pub mod counter_contract {
    use super::ICounter;

    #[storage]
    struct Storage {
        counter: u32
    }

    #[constructor]
    fn constructor(ref self: ContractState, initial_counter: u32) {
        self.counter.write(initial_counter);
    }

    #[abi(embed_v0)]
    impl Counter of ICounter<ContractState> {
        fn get_counter(self: @ContractState) -> u32 {
            let res = self.counter.read();
            res
        }
    }
}