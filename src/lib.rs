use substreams::errors::Error;
use substreams::log;
use substreams_database_change::pb::database::DatabaseChanges;
use substreams_database_change::pb::database::table_change::Operation;
use substreams_ethereum::pb::eth;
use substreams_solana::pb::sol;

#[substreams::handlers::map]
pub fn db_out_eth(
    blk: eth::v2::Block
) -> Result<DatabaseChanges, Error> {
    log::info!("db_out_eth");

    substreams::register_panic_hook();
    let mut database_changes: DatabaseChanges = Default::default();
    database_changes.push_change("test", "pk_test", 0,  Operation::Create)
        .change("key1", ("previous1", "value1"))
        .change("key3", ("previous1", "value1"))
        .change("key4", ("previous1", "value1"))
        .change("key2", ("previous2", "value2"));

    return Ok(database_changes);
}
#[substreams::handlers::map]
pub fn db_out_sol(
    blk: sol::v1::Block,
) -> Result<DatabaseChanges, Error> {
    log::info!("db_out_sol");

    substreams::register_panic_hook();
    let mut database_changes: DatabaseChanges = Default::default();
    database_changes.push_change("test", "pk_test", 0,  Operation::Create)
        .change("key1", ("previous1", "value1"))
        .change("key3", ("previous1", "value1"))
        .change("key4", ("previous1", "value1"))
        .change("key2", ("previous2", "value2"));

    return Ok(database_changes);
}

