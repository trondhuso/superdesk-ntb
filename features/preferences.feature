@wip
Feature: User preferences

    @auth
    Scenario: List empty preferences
        Given empty "preferences"
        When we get "/preferences"
        Then we get error 405
        """
        {"_error": {"message": "The method is not allowed for the requested URL.", "code": 405}, "_status": "ERR"}
        """


    @auth
    Scenario: Create new preference
        Given "users"
        """
        [{"username": "foo", "password": "barbar", "email": "foo@bar.com"}]
        """

        When we get "/preferences/#USERS_ID#"
        Then we get default preferences


    @auth
    Scenario: Update archive view preference settings
        Given "users"
        """
        [{"username": "foo", "password": "bar", "email": "foo@bar.com"}]
        """

        When we patch "/preferences/#USERS_ID#"
        """
        {"preferences": {"archive:view": {"view": "compact" }}}
        """

        When we get "/preferences/#USERS_ID#"
        Then we get existing resource
        """
        {"_id": "#USERS_ID#", "preferences": {"archive:view":
        {
        "type": "string",
        "view": "compact",
        "default": "mgrid",
        "label": "Users archive view format",
        "category": "archive"
        }}}
        """

    @auth
    Scenario: Update feature preview preference settings
        Given "users"
        """
        [{"username": "foo", "password": "bar", "email": "foo@bar.com"}]
        """

        When we patch "/preferences/#USERS_ID#"
        """
        {"preferences": {"feature:preview": {"enabled": true }}}
        """

        When we get "/preferences/#USERS_ID#"
        Then we get existing resource
        """
        {"_id": "#USERS_ID#", "preferences": {"feature:preview":
        {
        "type": "bool",
        "enabled": true,
        "default": false,
        "label": "Enable Feature Preview",
        "category": "feature"
        }}}
        """


    @auth
    Scenario: Update preference settings
        Given "users"
        """
        [{"username": "foo", "password": "bar", "email": "foo@bar.com"}]
        """

        When we patch "/preferences/#USERS_ID#"
        """
        {"preferences": {"email:notification": {"enabled": false }}}
        """

        When we get "/preferences/#USERS_ID#"
        Then we get existing resource
        """
        {"_id": "#USERS_ID#", "preferences": {"email:notification": 
        {
        "type": "bool",
        "enabled": false,
        "default": true,
        "label": "Send notifications via email",
        "category": "notifications"
        }}}
        """

    @auth
    Scenario: Update preference settings - wrong preference
        Given "users"
        """
        [{"username": "foo", "password": "bar", "email": "foo@bar.com"}]
        """

        When we patch "/preferences/#USERS_ID#"
        """
        {"preferences": {"email:bad_name": {"enabled": false }}}
        """
        Then we get error 400
        """
        {"_status": "ERR", "_issues": {"validator exception": "Invalid preference: email:bad_name"}}
	    """
