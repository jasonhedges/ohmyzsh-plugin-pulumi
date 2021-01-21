# Add your own custom plugins in the custom/plugins directory. Plugins placed
# here will override ones with the same name in the main plugins directory.

function pulumi_info() {
    local ref
    export PULUMI_SKIP_UPDATE_CHECK="true"
    export CURRENT_PULUMI_DIR="this"

    FILE=./Pulumi.yaml
    if test -f "$FILE"; then

        export CURRENT_PULUMI_DIR="TEST"
        ref=$(pulumi stack | grep "Current stack" -m 1)
        ref="${ref/Current stack is learningmachine\//}"
        ref="${ref/:/}"

        echo "[${ref}]"

        # workspace=$(ack -l $ref  ~/.pulumi/workspaces/)
    else
        echo ""
    fi
}