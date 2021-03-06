import _ from 'lodash';
import { combineReducers } from 'redux';
import channelcommands from './channelcommands';
import user from './user';
import sccommand from './sccommand';
import tidal from './tidal';
import timer from './timer';
import click from './click';
import matvals from './matvals';
import usererror from './usererror';
import { fetchModels } from '../actions';
const models = fetchModels();
const keys = {}
_.each(models, (x,key) => {
  const INITIAL_STATE = {}
  keys[x] = (state = INITIAL_STATE, action) => {
    switch (action.type) {
      case 'FETCH_' + x.toUpperCase():
        const items = _.mapKeys(action.payload, 'key')
        return { ...items };
    case 'FETCH_COMMANDS':
      const cmd = _.mapKeys(action.payload, 'key')
      return { ...cmd};
    default:
        return state
    }
  }
})

const rootReducer = combineReducers({
  channelcommands,
  sccommand,
  tidal,
  timer,
  user,
  usererror,
  click,
  matvals,
  ...keys
});

export default rootReducer;
