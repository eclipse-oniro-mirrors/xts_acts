'use static';
/**
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
import { describe, beforeEach, afterEach, it, expect, Level, beforeAll } from '../../../../hypium';
import router from '@ohos.router'
import { Driver, Component, ON } from '@ohos.UiTest'
import events_emitter from '@ohos.events.emitter';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest, startAbility } from '../Util.test';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import inspector from '@ohos.arkui.inspector';

export default function WaterFlowEffectEdge() {
  const SUITE: string = 'WaterFlowEffectEdge'
  const waitUiReadyMs: number = 1500

  describe('WaterFlowEffectEdge', () => {
    beforeAll(() => {
      console.info("WaterFlowEffectEdge beforeEach start");
      await UtilsTest.msSleep(4000);
      await startAbility("com.arkui.ace.scroll.nowear.api16.static", "EntryAbility");
      await UtilsTest.msSleep(4000);
    });

    beforeEach(async (): Promise<void> => {
      console.info("WaterFlowEffectEdge beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/WaterFlow/WaterFlowEffectEdge",
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get WaterFlowEffectEdge state pages:" + JSON.stringify(pages));
        if (!("WaterFlowEffectEdge" == pages.name)) {
          console.info("get WaterFlowEffectEdge pages.name:" + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push WaterFlowEffectEdge page error:" + err);
      }
      console.info("WaterFlowEffectEdge beforeEach end");
    });

    
    
/**
     * @tc.number   ArkUI_WaterFlow_EffectEdge_static_0500
     * @tc.name     ArkUI_WaterFlow_EffectEdge_static_0500
     * @tc.desc     ArkUI_WaterFlow_EffectEdge_static_0500
     * @tc.level    Level.LEVEL1
     */
it('ArkUI_WaterFlow_EffectEdge_static_0500', Level.LEVEL1, async (done: () => void): Promise<void> => {
      let json1 = inspector.getInspectorByKey('waterFlow4')
      await CommonFunc.sleep(1000)
      let obj = JSON.parseJsonElement(json1);
      let value = obj.getElement('$attrs').getElement('edgeEffectOptions').getString('effectEdge');
      console.log('ArkUI_WaterFlow_EffectEdge_static_0500 json1 ' + json1)
      console.log('ArkUI_WaterFlow_EffectEdge_static_0500 value ' + value)

      await CommonFunc.sleep(1000)
      expect(value).assertEqual('EffectEdge.Start')
      done()
    });
  })
}

async function sleep(count:int) : Promise<int> {
  return new Promise<int>((resolve, reject) => {
    setTimeout(() => {
      resolve(0)
    }, count)
  })
}
