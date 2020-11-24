trigger Tochecktriggernewfordelete on Account (before delete) {
    system.debug(trigger.new);

}