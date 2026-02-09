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

import { afterEach, beforeEach, describe, expect, it, beforeAll, Level } from '../../../../hypium/index';
import router from '@ohos.router';
import inspector from '@ohos.arkui.inspector'
import CommonFunc from '../../../ets/MainAbility/common/Common';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest, startAbility, stopApplication } from '../Util.test';

let domain: int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext: common.UIAbilityContext;

function sleep(time: number) {
  return new Promise<string>((resolve, reject) => {
    setTimeout(() => {
      resolve('');
    }, (time * 1000).toInt());
  }).then(() => {
    console.info(`sleep ${time} over...`);
  })
}


export default function ScrollJsunit() {
  describe('scrollTest', () => {
    beforeAll(() => {

      
      await UtilsTest.startAbility("com.arkui.ace.scroll.static", "EntryAbility")
      
    });
    beforeEach(async (): Promise<void> => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Scroll/ScrollA',
      }
      try {
        const routerAlp = AppStorage.get<Router>("router") as Router
        routerAlp.clear();
        let pages = routerAlp.getState();
        console.info("get Scroll state success " + JSON.stringify(pages));
        if (!("ScrollA" == pages.name)) {
          console.info("get Scroll state success " + JSON.stringify(pages.name));
          // let result = await routerAlp.pushUrl(options);
          routerAlp.pushUrl(options);
          // console.info("push Scroll page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push Scroll page error " + JSON.stringify(err));
      }
      await sleep(2);
    });

    afterEach(async () => {
      await sleep(1);
      console.info("Scroll after each called");
    });


    
    /**
     * @tc.number   testScrollGetInspectorByKey010_static_01
     * @tc.name     testScrollGetInspectorByKey010_static_01
     * @tc.desc     testScrollGetInspectorByKey010_static_01
     * @tc.level    Level.LEVEL0
     */
it('testScrollGetInspectorByKey010_static_01', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('testGetInspectorByKey START');
      let strJson = inspector.getInspectorByKey('scroll');
      let obj = JSON.parseJsonElement(strJson);
      console.info("cd scroll component obj is: " + JSON.stringify(obj));
      console.log("cd scroll type" + JSON.stringify(obj.getString('$type')));
      console.log("cd scroll scrollable" + JSON.stringify(obj.getElement('$attrs').getString('scrollable')));
      console.log("cd scroll scrollBar" + JSON.stringify(obj.getElement('$attrs').getString('scrollBar')));
      console.log("cd scroll scrollBarColor" + JSON.stringify(obj.getElement('$attrs').getString('scrollBarColor')));
      console.log("cd scroll scrollBarWidth" + JSON.stringify(obj.getElement('$attrs').getString('scrollBarWidth')));
      expect(obj.getString('$type')).assertEqual('Scroll');
      expect(obj.getElement('$attrs').getString('scrollable')).assertEqual('ScrollDirection.Vertical');
      expect(obj.getElement('$attrs').getString('scrollBarColor')).assertEqual('#FFFFC0CB');
      expect(obj.getElement('$attrs').getString('scrollBarWidth')).assertEqual('20.00vp');
      console.info('cd ScorllGetInspectorByKey END');
      done();
    });


    
    /**
     * @tc.number   testScrollGetInspectorByKey020_static_02
     * @tc.name     testScrollGetInspectorByKey020_static_02
     * @tc.desc     testScrollGetInspectorByKey020_static_02
     * @tc.level    Level.LEVEL0
     */
it('testScrollGetInspectorByKey020_static_02', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let strJson = inspector.getInspectorByKey('scroll1');
      let obj = JSON.parseJsonElement(strJson);
      console.info("cd scroll1 component obj is: " + JSON.stringify(obj));
      console.log("cd scroll1 scrollable" + JSON.stringify(obj.getElement('$attrs').getString('scrollable')));
      console.log("cd scroll1 scrollBar" + JSON.stringify(obj.getElement('$attrs').getString('scrollBar')));
      expect(obj.getElement('$attrs').getString('scrollable')).assertEqual('ScrollDirection.Horizontal');
      expect(obj.getElement('$attrs').getString('scrollBar')).assertEqual('BarState.Auto');
      console.info('cd Scorll1GetInspectorByKey END');
      done();
    });


    
    /**
     * @tc.number   testScrollGetInspectorByKey030
     * @tc.name     testScrollGetInspectorByKey030
     * @tc.desc     testScrollGetInspectorByKey030
     * @tc.level    Level.LEVEL0
     */
it('testScrollGetInspectorByKey030', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let strJson = inspector.getInspectorByKey('scroll2');
      let obj = JSON.parseJsonElement(strJson);
      console.info("cd scroll2 component obj is: " + JSON.stringify(obj));
      console.log("cd scroll2 scrollable" + JSON.stringify(obj.getElement('$attrs').getString('scrollable')));
      console.log("cd scroll2 scrollBar" + JSON.stringify(obj.getElement('$attrs').getString('scrollBar')));
      expect(obj.getElement('$attrs').getString('scrollable')).assertEqual('ScrollDirection.None');
      expect(obj.getElement('$attrs').getString('scrollBar')).assertEqual('BarState.Off');
      console.info('cd Scorll2GetInspectorByKey END');
      done();
    });


    
    /**
     * @tc.number   testScrollGetInspectorByKey040
     * @tc.name     testScrollGetInspectorByKey040
     * @tc.desc     testScrollGetInspectorByKey040
     * @tc.level    Level.LEVEL0
     */
it('testScrollGetInspectorByKey040', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let strJson = inspector.getInspectorByKey('scroll3');
      let obj = JSON.parseJsonElement(strJson);
      console.info("cd scroll3 component obj is: " + JSON.stringify(obj));
      console.log("cd scroll3 scrollable" + JSON.stringify(obj.getElement('$attrs').getString('scrollable')));
      console.log("cd scroll3 scrollBar" + JSON.stringify(obj.getElement('$attrs').getString('scrollBar')));
      expect(obj.getElement('$attrs').getString('scrollBar')).assertEqual('BarState.Off');
      console.info('cd Scorll3GetInspectorByKey END');
      done();
    });
  })
}
