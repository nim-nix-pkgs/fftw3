{
  description = ''Nim FFTW bindings'';

  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.ref   = "master";
  inputs.flakeNimbleLib.repo  = "nim-flakes-lib";
  inputs.flakeNimbleLib.type  = "github";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
  
  inputs.src-fftw3-v0_4_4.flake = false;
  inputs.src-fftw3-v0_4_4.owner = "SciNim";
  inputs.src-fftw3-v0_4_4.ref   = "v0_4_4";
  inputs.src-fftw3-v0_4_4.repo  = "nimfftw3";
  inputs.src-fftw3-v0_4_4.type  = "github";
  
  inputs."arraymancer".owner = "nim-nix-pkgs";
  inputs."arraymancer".ref   = "master";
  inputs."arraymancer".repo  = "arraymancer";
  inputs."arraymancer".dir   = "v0_7_11";
  inputs."arraymancer".type  = "github";
  inputs."arraymancer".inputs.nixpkgs.follows = "nixpkgs";
  inputs."arraymancer".inputs.flakeNimbleLib.follows = "flakeNimbleLib";
  
  inputs."weave".owner = "nim-nix-pkgs";
  inputs."weave".ref   = "master";
  inputs."weave".repo  = "weave";
  inputs."weave".dir   = "";
  inputs."weave".type  = "github";
  inputs."weave".inputs.nixpkgs.follows = "nixpkgs";
  inputs."weave".inputs.flakeNimbleLib.follows = "flakeNimbleLib";
  
  outputs = { self, nixpkgs, flakeNimbleLib, ...}@deps:
  let 
    lib  = flakeNimbleLib.lib;
    args = ["self" "nixpkgs" "flakeNimbleLib" "src-fftw3-v0_4_4"];
  in lib.mkRefOutput {
    inherit self nixpkgs ;
    src  = deps."src-fftw3-v0_4_4";
    deps = builtins.removeAttrs deps args;
    meta = builtins.fromJSON (builtins.readFile ./meta.json);
  };
}