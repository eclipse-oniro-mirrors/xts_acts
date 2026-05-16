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
import { describe, beforeAll, beforeEach, afterEach, it, expect, afterAll, Level } from '../../../../hypium/index'
import router from '@ohos.router'
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { Driver, Component, ON } from '@ohos.UiTest'
import { UIContext, Router } from '@ohos.arkui.UIContext';
import events_emitter from '@ohos.events.emitter';
import { BusinessError } from '@ohos.base';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry'
import UIAbility from '@ohos.app.ability.UIAbility';
import hilog from '@ohos.hilog'
import common from '@ohos.app.ability.common';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { BusinessError } from '@ohos.base';
import inspector from '@ohos.arkui.inspector';
import { UtilsTest, startAbility } from '../Util.test';

let testAbilityContext: common.UIAbilityContext;
let domain: int = 0x0000;
let tag: string = 'testTag';

export default function ScrollEffectEdge() {
  const SUITE: string = 'ScrollEffectEdge'
  const waitUiReadyMs: number = 1500

  describe('ScrollEffectEdge', () => {

    beforeAll(() => {
      console.info("ScrollEffectEdge beforeEach start");
      await UtilsTest.startAbility("com.arkui.ace.scroll16.static", "EntryAbility");
      
    });

    beforeEach(async (): Promise<void> => {
      console.info("ScrollEffectEdge beforeEach start");
      const ScrollEffectEdge = AppStorage.get<Router>("router") as Router
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Scroll/ScrollEffectEdge",
      }
      try {
        let pages = ScrollEffectEdge.getState();
        console.info("get ScrollEffectEdge state pages:" + JSON.stringify(pages));
        if (!("MainAbility/pages/Scroll/ScrollEffectEdge" == pages.name)) {
          console.info("get ScrollEffectEdge pages.name:" + JSON.stringify(pages.name));
          ScrollEffectEdge.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push ScrollEffectEdge page error:" + err);
      }
      console.info("ScrollEffectEdge beforeEach end");
    });
    afterAll(() => {
      const router = AppStorage.get<Router>("router") as Router
      router.back()
    });


    
    /**
     * @tc.number   ArkUI_Scroll_EffectEdge_static_0100
     * @tc.name     ArkUI_Scroll_EffectEdge_static_0100
     * @tc.desc     ArkUI_Scroll_EffectEdge_static_0100
     * @tc.level    Level.LEVEL0
     */
it('ArkUI_Scroll_EffectEdge_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let json1 = inspector.getInspectorByKey('scroll1')
      await sleep(1000)
      let obj = JSON.parseJsonElement(json1);
      let value: string = obj.getElement('$attrs').getElement('edgeEffectOptions').getString('effectEdge');
      console.log('ArkUI_Scroll_EffectEdge_static_0100 json1 ' + json1)
      console.log('ArkUI_Scroll_EffectEdge_static_0100 value ' + value)

      await sleep(1000)
      expect(value).assertEqual('EffectEdge.Start')
      done()
    });


    
    /**
     * @tc.number   ArkUI_Scroll_EffectEdge_static_0200
     * @tc.name     ArkUI_Scroll_EffectEdge_static_0200
     * @tc.desc     ArkUI_Scroll_EffectEdge_static_0200
     * @tc.level    Level.LEVEL0
     */
it('ArkUI_Scroll_EffectEdge_static_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let json1 = inspector.getInspectorByKey('scroll2')
      await sleep(1000)
      let obj = JSON.parseJsonElement(json1);
      let value: string = obj.getElement('$attrs').getElement('edgeEffectOptions').getString('effectEdge');
      console.log('ArkUI_Scroll_EffectEdge_static_0200 json1 ' + json1)
      console.log('ArkUI_Scroll_EffectEdge_static_0200 value ' + value)

      await sleep(1000)
      expect(value).assertEqual('EffectEdge.All')
      done()
    });


    
    /**
     * @tc.number   ArkUI_Scroll_EffectEdge_static_0300
     * @tc.name     ArkUI_Scroll_EffectEdge_static_0300
     * @tc.desc     ArkUI_Scroll_EffectEdge_static_0300
     * @tc.level    Level.LEVEL0
     */
it('ArkUI_Scroll_EffectEdge_static_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let json1 = inspector.getInspectorByKey('list2')
      await sleep(1000)
      let obj = JSON.parseJsonElement(json1);
      let value: string = obj.getElement('$attrs').getElement('edgeEffectOptions').getString('effectEdge');
      console.log('ArkUI_Scroll_EffectEdge_static_0300 json1 ' + json1)
      console.log('ArkUI_Scroll_EffectEdge_static_0300 value ' + value)

      await sleep(1000)
      expect(value).assertEqual('EffectEdge.End')
      done()
    });


    
    /**
     * @tc.number   ArkUI_Scroll_EffectEdge_static_0400
     * @tc.name     ArkUI_Scroll_EffectEdge_static_0400
     * @tc.desc     ArkUI_Scroll_EffectEdge_static_0400
     * @tc.level    Level.LEVEL0
     */
it('ArkUI_Scroll_EffectEdge_static_0400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let json1 = inspector.getInspectorByKey('grid3')
      await sleep(1000)
      let obj = JSON.parseJsonElement(json1);
      let value = obj.getElement('$attrs').getElement('edgeEffectOptions').getString('effectEdge');
      console.log('ArkUI_Scroll_EffectEdge_static_0400 json1 ' + json1)
      console.log('ArkUI_Scroll_EffectEdge_static_0400 value ' + value)

      await sleep(1000)
      expect(value).assertEqual('EffectEdge.All')
      done()
    });
  })
}


async function sleep(time: int): Promise<int> {
  return new Promise<int>((resolve, reject) => {
    setTimeout(() => {
      console.info(`sleep ${time} over...`)
      resolve(0)
    }, time)
  })
}