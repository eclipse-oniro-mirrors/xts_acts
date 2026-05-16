'use static';
/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import hilog from '@ohos.hilog';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '../../../../hypium/index'
import Utils from '../Utils.test'
import router from '@ohos.router';
import {ComponentUtils} from '@ohos.arkui.UIContext'
import {MessageManager,Callback} from '../../../ets/MainAbility/common/MessageManager';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector';
import {UtilsTest, startAbility, stopApplication} from "../Util.test"
import inspector from '@ohos.arkui.inspector'
import componentRect from '@ohos.arkui.componentUtils'

let domain: Int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;


export default function ActsgetcomponentaddTest() {
  describe('ActsgetcomponentaddTest', () => {
    beforeAll(() => {
      console.info("Builder0050TestJsunit beforeEach start");

     await UtilsTest.startAbility("com.arkui.ace.imageText.nowear.static", "EntryAbility");
    });
    beforeEach(async (): Promise<void> => {
      console.info("flex beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/button/getcomponentadd',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get getcomponentadd state success " + JSON.stringify(pages));
        if (!("getcomponentadd" == pages.name)) {
          console.info("get getcomponentadd state success " + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
        }
      } catch (err) {
        console.error("push getcomponentadd page error: " + err);
      }
    });
    
    /**
     * @tc.number   ArkUX_Get_component_add_static_0010
     * @tc.name     ArkUX_Get_component_add_static_0010
     * @tc.desc     ArkUX_Get_component_add_static_0010
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Get_component_add_static_0010', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Get_component_add_0010 START');
      setTimeout(() => {
          let strJson = Utils.getComponentRect('ArkUX_Get_component_add_0010');
          expect(strJson.width instanceof number).assertTrue();
          expect(strJson.height instanceof number).assertTrue();
          expect(strJson.localOffsetX instanceof number).assertTrue();
          expect(strJson.localOffsetY instanceof number).assertTrue();
          expect(strJson.windowOffsetX instanceof number).assertTrue();
          expect(strJson.windowOffsetY instanceof number).assertTrue();
          expect(strJson.screenOffsetX instanceof number).assertTrue();
          expect(strJson.screenOffsetY instanceof number).assertTrue();
          console.info('ArkUX_Get_component_add_0010 END ');
        done();
      }, 500)
    });

    
    
    
    /**
     * @tc.number   ArkUX_Get_component_add_static_0020
     * @tc.name     ArkUX_Get_component_add_static_0020
     * @tc.desc     ArkUX_Get_component_add_static_0020
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Get_component_add_static_0020', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Get_component_add_0020 START');
      setTimeout(() => {
          let strJson = Utils.getComponentRect('ArkUX_Get_component_add_0020');
          expect(strJson.width instanceof number).assertTrue();
          expect(strJson.height instanceof number).assertTrue();
          expect(strJson.localOffsetX instanceof number).assertTrue();
          expect(strJson.localOffsetY instanceof number).assertTrue();
          expect(strJson.windowOffsetX instanceof number).assertTrue();
          expect(strJson.windowOffsetY instanceof number).assertTrue();
          expect(strJson.screenOffsetX instanceof number).assertTrue();
          expect(strJson.screenOffsetY instanceof number).assertTrue();
          console.info('ArkUX_Get_component_add_0020 END ');
        done();
      }, 500)
    });

    
    
    
    /**
     * @tc.number   ArkUX_Get_component_add_static_0030
     * @tc.name     ArkUX_Get_component_add_static_0030
     * @tc.desc     ArkUX_Get_component_add_static_0030
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Get_component_add_static_0030', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Get_component_add_0030 START');
      setTimeout(() => {
          let strJson = Utils.getComponentRect('ArkUX_Get_component_add_0030');
          expect(strJson.width instanceof number).assertTrue();
          expect(strJson.height instanceof number).assertTrue();
          expect(strJson.localOffsetX instanceof number).assertTrue();
          expect(strJson.localOffsetY instanceof number).assertTrue();
          expect(strJson.windowOffsetX instanceof number).assertTrue();
          expect(strJson.windowOffsetY instanceof number).assertTrue();
          expect(strJson.screenOffsetX instanceof number).assertTrue();
          expect(strJson.screenOffsetY instanceof number).assertTrue();
          console.info('ArkUX_Get_component_add_0030 END ');
        done();
      }, 500)
    });

    
    
    
    /**
     * @tc.number   ArkUX_Get_component_add_static_0040
     * @tc.name     ArkUX_Get_component_add_static_0040
     * @tc.desc     ArkUX_Get_component_add_static_0040
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Get_component_add_static_0040', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Get_component_add_0040 START');
      setTimeout(() => {
          let strJson = Utils.getComponentRect('ArkUX_Get_component_add_0040');
          expect(strJson.width instanceof number).assertTrue();
          expect(strJson.height instanceof number).assertTrue();
          expect(strJson.localOffsetX instanceof number).assertTrue();
          expect(strJson.localOffsetY instanceof number).assertTrue();
          expect(strJson.windowOffsetX instanceof number).assertTrue();
          expect(strJson.windowOffsetY instanceof number).assertTrue();
          expect(strJson.screenOffsetX instanceof number).assertTrue();
          expect(strJson.screenOffsetY instanceof number).assertTrue();
          console.info('ArkUX_Get_component_add_0040 END ');
        done();
      }, 500)
    });

    
    
    
    /**
     * @tc.number   ArkUX_Get_component_add_static_0050
     * @tc.name     ArkUX_Get_component_add_static_0050
     * @tc.desc     ArkUX_Get_component_add_static_0050
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Get_component_add_static_0050', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Get_component_add_0050 START');
      setTimeout(() => {
          let strJson = Utils.getComponentRect('ArkUX_Get_component_add_0050');
          expect(strJson.width instanceof number).assertTrue();
          expect(strJson.height instanceof number).assertTrue();
          expect(strJson.localOffsetX instanceof number).assertTrue();
          expect(strJson.localOffsetY instanceof number).assertTrue();
          expect(strJson.windowOffsetX instanceof number).assertTrue();
          expect(strJson.windowOffsetY instanceof number).assertTrue();
          expect(strJson.screenOffsetX instanceof number).assertTrue();
          expect(strJson.screenOffsetY instanceof number).assertTrue();
          console.info('ArkUX_Get_component_add_0050 END ');
        done();
      }, 500)
    });

    
    
    
    /**
     * @tc.number   ArkUX_Get_component_add_static_0060
     * @tc.name     ArkUX_Get_component_add_static_0060
     * @tc.desc     ArkUX_Get_component_add_static_0060
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Get_component_add_static_0060', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Get_component_add_0060 START');
      setTimeout(() => {
          let strJson = Utils.getComponentRect('ArkUX_Get_component_add_0060');
          expect(strJson.width instanceof number).assertTrue();
          expect(strJson.height instanceof number).assertTrue();
          expect(strJson.localOffsetX instanceof number).assertTrue();
          expect(strJson.localOffsetY instanceof number).assertTrue();
          expect(strJson.windowOffsetX instanceof number).assertTrue();
          expect(strJson.windowOffsetY instanceof number).assertTrue();
          expect(strJson.screenOffsetX instanceof number).assertTrue();
          expect(strJson.screenOffsetY instanceof number).assertTrue();
          console.info('ArkUX_Get_component_add_0060 END ');
        done();
      }, 500)
    });

    
    
    
    /**
     * @tc.number   ArkUX_Get_component_add_static_0070
     * @tc.name     ArkUX_Get_component_add_static_0070
     * @tc.desc     ArkUX_Get_component_add_static_0070
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Get_component_add_static_0070', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Get_component_add_0070 START');
      setTimeout(() => {
          let strJson = Utils.getComponentRect('ArkUX_Get_component_add_0070');
          expect(strJson.width instanceof number).assertTrue();
          expect(strJson.height instanceof number).assertTrue();
          expect(strJson.localOffsetX instanceof number).assertTrue();
          expect(strJson.localOffsetY instanceof number).assertTrue();
          expect(strJson.windowOffsetX instanceof number).assertTrue();
          expect(strJson.windowOffsetY instanceof number).assertTrue();
          expect(strJson.screenOffsetX instanceof number).assertTrue();
          expect(strJson.screenOffsetY instanceof number).assertTrue();
          console.info('ArkUX_Get_component_add_0070 END ');
        done();
      }, 500)
    });

    
    
    
    /**
     * @tc.number   ArkUX_Get_component_add_static_0080
     * @tc.name     ArkUX_Get_component_add_static_0080
     * @tc.desc     ArkUX_Get_component_add_static_0080
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Get_component_add_static_0080', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Get_component_add_0080 START');
      setTimeout(() => {
          let strJson = Utils.getComponentRect('ArkUX_Get_component_add_0080');
          expect(strJson.width instanceof number).assertTrue();
          expect(strJson.height instanceof number).assertTrue();
          expect(strJson.localOffsetX instanceof number).assertTrue();
          expect(strJson.localOffsetY instanceof number).assertTrue();
          expect(strJson.windowOffsetX instanceof number).assertTrue();
          expect(strJson.windowOffsetY instanceof number).assertTrue();
          expect(strJson.screenOffsetX instanceof number).assertTrue();
          expect(strJson.screenOffsetY instanceof number).assertTrue();
          console.info('ArkUX_Get_component_add_0080 END ');
        done();
      }, 500)
    });

    
    
    
    /**
     * @tc.number   ArkUX_Get_component_add_static_0090
     * @tc.name     ArkUX_Get_component_add_static_0090
     * @tc.desc     ArkUX_Get_component_add_static_0090
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Get_component_add_static_0090', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Get_component_add_0090 START');
      setTimeout(() => {
          let strJson = Utils.getComponentRect('ArkUX_Get_component_add_0090');
          expect(strJson.width instanceof number).assertTrue();
          expect(strJson.height instanceof number).assertTrue();
          expect(strJson.localOffsetX instanceof number).assertTrue();
          expect(strJson.localOffsetY instanceof number).assertTrue();
          expect(strJson.windowOffsetX instanceof number).assertTrue();
          expect(strJson.windowOffsetY instanceof number).assertTrue();
          expect(strJson.screenOffsetX instanceof number).assertTrue();
          expect(strJson.screenOffsetY instanceof number).assertTrue();
          console.info('ArkUX_Get_component_add_0090 END ');
        done();
      }, 500)
    });

    
    
    
    /**
     * @tc.number   ArkUX_Get_component_add_static_0100
     * @tc.name     ArkUX_Get_component_add_static_0100
     * @tc.desc     ArkUX_Get_component_add_static_0100
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Get_component_add_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Get_component_add_0100 START');
      setTimeout(() => {
          let strJson = Utils.getComponentRect('ArkUX_Get_component_add_0100');
          expect(strJson.width instanceof number).assertTrue();
          expect(strJson.height instanceof number).assertTrue();
          expect(strJson.localOffsetX instanceof number).assertTrue();
          expect(strJson.localOffsetY instanceof number).assertTrue();
          expect(strJson.windowOffsetX instanceof number).assertTrue();
          expect(strJson.windowOffsetY instanceof number).assertTrue();
          expect(strJson.screenOffsetX instanceof number).assertTrue();
          expect(strJson.screenOffsetY instanceof number).assertTrue();
          console.info('ArkUX_Get_component_add_0100 END ');
        done();
      }, 500)
    });

  })
}