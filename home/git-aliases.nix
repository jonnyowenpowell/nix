{
  programs.git.aliases = {
    # Basic commands
    a = "add";
    aa = "add -A";
    ah = "!git add -N \":/*\" && git add -p \":/*\"";
    b = "branch";
    bd = "branch -D";
    ignored = "!git ls-files -v | grep \"^[[:lower:]]\"";
    mm = "merge main";
    u = "restore --";
    us = "restore --staged --";
    x = "status";

    # Clone commands
    fgh = "!f() { git clone \"git@github.com:$1.git\"; }; f";

    # Checkout commands
    co = "checkout";
    cob = "checkout -b";

    # Commit commands
    amend = "commit --amend --no-edit";
    c = "commit";
    cm = "commit -m";

    # Fetch commands
    f = "fetch";
    fm = "fetch origin main:main";
    fp = "fetch --prune";

    # Push commands
    p = "push";
    pf = "push --force-with-lease";
    pff = "push --force";
    pn = "!f() { local branch; branch=$(git branch --show-current); git push -u origin \"$branch\"; }; f";

    # Pull commands
    pl = "pull";

    # Stash commands
    sa = "stash apply";
    sd = "stash drop";
    sl = "stash list";
    sm = "stash --staged -m";
    sp = "stash pop";
    sv = "stash show -p";

    # Rebase commands
    rb = "rebase";
    rba = "rebase --abort";
    rbc = "rebase --continue";
    rbi = "rebase --interactive";
    rbs = "rebase --skip";
  };
}
