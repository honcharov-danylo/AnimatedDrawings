from animated_drawings import render_json
from animated_drawings.config_json import Config
import json

with open("json_configs_example/example_config.json", "r") as f:
    cfg_dict = json.load(f)
with open("json_configs_example/character.json", "r") as f:
    character_cfg = json.load(f)
with open("json_configs_example/motion.json", "r") as f:
    motion_cfg = json.load(f)
with open("json_configs_example/retarget.json", "r") as f:
    retarget_cfg = json.load(f)

cfg: Config = Config(cfg_dict,[{'character_cfg':character_cfg,'motion_cfg':motion_cfg,'retarget_cfg':retarget_cfg}])
render_json.start(cfg)
