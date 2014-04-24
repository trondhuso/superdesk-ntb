define([
    'require',
    './sdModal',
    './sdAutofocus',
    './sdDebounceThrottle',
    './sdSort',
    './sdCheck',
    './sdWithParams',
    './sdModal',
    './sdConfirm',
    './sdSelect',
    './sdPermissions',
    './sdUserAvatar',
    './sdDragDrop',
    './menu',
    './sdTypeahead',
    './sdNotifications'
], function(require) {
    'use strict';

    return [
        require('./sdAutofocus').name,
        require('./sdDebounceThrottle').name,
        require('./sdModal').name,
        require('./sdSort').name,
        require('./sdWithParams').name,
        require('./sdCheck').name,
        require('./sdConfirm').name,
        require('./sdSelect').name,
        require('./sdPermissions').name,
        require('./sdUserAvatar').name,
        require('./sdDragDrop').name,
        require('./menu').name,
        require('./sdTypeahead').name,
        require('./sdNotifications').name
    ];
});
