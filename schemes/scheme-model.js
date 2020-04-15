const db = require('../data/dbConfig');

module.exports = {
    find,
    findById,
    findSteps,
    add,
    update,
    remove
};

function find() {
    return db('schemes');
}

function findById(id) {
    return db('schemes')
        .where({ id })
        .first()
}

function findSteps(id) {
    return db('steps as st')
        .select('st.step_number', 'st.instructions', 'sc.scheme_name')
        .join('schemes as sc', 'sc.id', 'st.scheme_id')
        .where('scheme_id', id)
        .orderBy('st.step_number')
}

function add(scheme) {
    return db('schemes')
        .insert(scheme)
        .then(ids => {
            return findById(ids[0]);
        });
}

function update(changes, id) {
    return db('schemes')
        .where({ id })
        .update(changes)
        .then(() => {
            return findById(id);
        });
}

function remove(id) {
    return db('schemes')
        .where('id', id)
        .del();
}