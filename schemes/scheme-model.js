const knex = require("knex");
const config = require("../knexfile");

const db = knex(config.development);

module.exports = {
  find,
  findById,
  add,
  update,
  remove,
  findSteps,
  addStep,
  findByStepID,
};

function find() {
  return db("schemes");
}

function findById(id) {
  return db("schemes").where({ id }).first();
}

function add(scheme) {
  return db("schemes")
    .insert(scheme)
    .then((ids) => {
      return findById(ids[0]);
    });
}

function update(changes, id) {
  return db("schemes")
    .where({ id })
    .update(changes)
    .then(() => {
      return findById(id);
    });
}

async function remove(id) {
  const removedScheme = await findById(id);
  return db("schemes")
    .where({ id })
    .del()
    .then(() => {
      return removedScheme;
    });
}

function findSteps(id) {
  return db("schemes")
    .join("steps", "schemes.id", "steps.scheme_id")
    .select(
      "steps.id",
      "schemes.scheme_name",
      "steps.step_number",
      "steps.instructions"
    )
    .where({ "schemes.id": id });
}

function findByStepID(id) {
  return db("steps").where({ id }).first();
}

function addStep(step, scheme_id) {
  return db("steps")
    .insert({
      scheme_id: scheme_id,
      step_number: step.step_number,
      instructions: step.instructions,
    })
    .then((ids) => {
      console.log(ids[0]);
      return findByStepID(ids[0]);
    });
}
