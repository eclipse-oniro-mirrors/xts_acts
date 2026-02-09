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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "../../../../hypium/index"
import router from '@ohos.router';
import { Component, Driver, UiWindow, ON,  MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix } from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { MessageManager, Callback } from '../../../ets/MainAbility/common/MessageManager';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test';
import inspector from '@ohos.arkui.inspector';
import accessibility from '@ohos.accessibility';

let domain: Int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;

function sleep(time: int) {
  return new Promise<int>((resolve, reject) => {
    setTimeout(() => {
      resolve(0);
    }, time * 1000);
  })
}

export default function badgeJsunit() {

  describe('badgeTest', () => {
    beforeAll(() => {
      console.info("badgeTest beforeEach start");
      await UtilsTest.startAbility("com.arkui.ace.information.static", "EntryAbility");
    });
    beforeEach(async (): Promise<void> => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Badge/Badge',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get Badge state success " + JSON.stringify(pages));
        if (!("Badge" == pages.name)) {
          console.info("get Badge state success " + JSON.stringify(pages.name));
          routerInstance.replaceUrl(options)
        }
      } catch (err) {
        console.error("push Badge page error " + JSON.stringify(err));
      }
      await sleep(2);
    });

    afterEach(async (): Promise<void> => {
      await sleep(1);
      console.info("Badge after each called");
    });


    /**
     * @tc.number   testBadge_static_010
     * @tc.name     testBadge_static_010
     * @tc.desc     testBadge_static_010
     * @tc.level    Level.LEVEL0
     */
it('testBadge_static_010', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('new Badge0 START');
      let strJson = inspector.getInspectorByKey('badge');
      let obj = JSON.parseJsonElement(strJson);
      let style = JSON.parseJsonElement(obj.getElement('$attrs').getString('style'));
      expect(obj.getString('$type')).assertEqual('Badge');
      console.log(JSON.stringify(obj.getString('$type')));
      console.info("yr badge0 type: " + JSON.stringify(obj.getString('$type')));
      console.info("component obj is: " + JSON.stringify(obj));
      expect(obj.getElement('$attrs').getString('count')).assertEqual('33');
      console.log("yr badge0 count-'33'" + JSON.stringify(obj.getElement('$attrs').getString('count')));
      expect(obj.getElement('$attrs').getString('position')).assertEqual('BadgePosition.Right');
      console.log("yr badge0 position-BadgePosition.Right" + JSON.stringify(obj.getElement('$attrs').getString('position')));
      expect(obj.getElement('$attrs').getString('maxCount')).assertEqual('99');
      console.log("yr badge0 maxCount-'99'" + JSON.stringify(obj.getElement('$attrs').getString('maxCount')));
      console.log("yr badge0 style.color" + style.getString('color'));
      console.log("yr badge0 style.fontSize" + style.getString('fontSize'));
      console.log("yr badge0 style.badgeSize" + style.getString('badgeSize'));
      expect(style.getString('color')).assertEqual('#FFFFFFFF');
      expect(style.getString('fontSize')).assertEqual('16.00fp');
      expect(style.getString('badgeSize')).assertEqual('20.00fp');
      console.log("badge0 style : " + JSON.stringify(obj.getElement('$attrs').getString('style')));
      console.info('testGetInspectorByKey END');
      done();
    });


    /**
     * @tc.number   testBadge_static_020
     * @tc.name     testBadge_static_020
     * @tc.desc     testBadge_static_020
     * @tc.level    Level.LEVEL0
     */
it('testBadge_static_020', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('new Badge1 START');
      let strJson = inspector.getInspectorByKey('badge1');
      let obj = JSON.parseJsonElement(strJson);
      let style = JSON.parseJsonElement(obj.getElement('$attrs').getString('style'));
      console.info("component obj is: " + JSON.stringify(obj));
      expect(obj.getElement('$attrs').getString('position')).assertEqual('BadgePosition.RightTop');
      console.log("yr badge1 position-'BadgePosition.RightTop'" + JSON.stringify(obj.getElement('$attrs').getString('position')));
      console.log("yr badge0 style.fontSize" + style.getString('fontSize'));
      console.log("yr badge0 style.badgeSize" + style.getString('badgeSize'));
      expect(style.getString('fontSize')).assertEqual('16.00fp');
      expect(style.getString('badgeSize')).assertEqual('20.00fp');
      console.info('new Badge1 END');
      done();
    });


    /**
     * @tc.number   testBadge_static_030
     * @tc.name     testBadge_static_030
     * @tc.desc     testBadge_static_030
     * @tc.level    Level.LEVEL0
     */
it('testBadge_static_030', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('new Badge2 START');
      let strJson = inspector.getInspectorByKey('badge2');
      let obj = JSON.parseJsonElement(strJson);
      console.info("component obj is: " + JSON.stringify(obj));
      expect(obj.getElement('$attrs').getString('position')).assertEqual('BadgePosition.Left');
      console.log("yr badge2 position-'BadgePosition.Left'" + JSON.stringify(obj.getElement('$attrs').getString('position')));
      console.info('testGetInspectorByKey END');
      done();
    });
  })
}
