{
  programs.git.aliases = {
    # Basic commands
    a = "add";
    aa = "add -A";
    ah = "!git add -N \":/*\" && git add -p \":/*\"";
    b = "branch";
    ignored = "!git ls-files -v | grep \"^[[:lower:]]\"";
    mm = "merge main";
    s = "status";

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

    # Push/pull commands
    p = "push";
    pl = "pull";
    pn = "!f() { local branch; branch=$(git branch --show-current); git push -u origin \"$branch\"; }; f";

    # Rebase commands
    rb = "rebase";
    rba = "rebase --abort";
    rbc = "rebase --continue";
    rbi = "rebase --interactive";
    rbs = "rebase --skip";
  };
}
