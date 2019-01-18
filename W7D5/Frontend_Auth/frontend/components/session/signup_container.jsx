import { connect } from 'react-redux';
import { createNewUser } from '../../actions/session';
import Signup from './signup';

const mdp = dispatch => {
  return ({
  createNewUser: formUser => {
    return dispatch(createNewUser(formUser));
    }
});
};

export default connect(null, mdp)(Signup);