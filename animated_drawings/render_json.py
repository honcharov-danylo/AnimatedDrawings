# Copyright (c) Meta Platforms, Inc. and affiliates.
# This source code is licensed under the MIT license found in the
# LICENSE file in the root directory of this source tree.

import logging
import sys
from animated_drawings.config_json import Config


def start(cfg:Config):
    # create view
    from animated_drawings.view.view import View
    view = View.create_view(cfg.view)

    # create scene
    from animated_drawings.model.scene import Scene
    scene = Scene(cfg.scene)

    # create controller
    from animated_drawings.controller.controller import Controller
    controller = Controller.create_controller(cfg.controller, scene, view)
    # start the run loop
    controller.run()


if __name__ == '__main__':
    logging.basicConfig(filename='log.txt', level=logging.DEBUG)
