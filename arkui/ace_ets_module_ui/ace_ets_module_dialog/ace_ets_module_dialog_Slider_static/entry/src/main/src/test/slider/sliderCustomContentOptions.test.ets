/**
 * Copyright (c) 2026 Shenzhen Kaihong Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

'use static';

import { describe, it, expect, beforeAll, afterEach, Level, beforeEach } from '../../../../hypium/index';
import { abilityDelegatorRegistry, Driver, ON, MatchPattern } from '@kit.TestKit';
import router from '@ohos.router';
import Utils from '../../../ets/MainAbility/common/Utils';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test';
import inspector from '@ohos.arkui.inspector';

const SLEEP_TIME = 1000;
const LOG_CHUNK_SIZE = 500;

function logLongString(tag: string, longStr: string): void {
  let len = longStr.length;
  let part = 1;
  for (let i = 0; i < len; i += LOG_CHUNK_SIZE) {
    let end = i + LOG_CHUNK_SIZE;
    if (end > len) {
      end = len;
    }
    console.info(`${tag} [${part}] ${longStr.substring(i, end)}`);
    part++;
  }
}

export default function SliderCustomContentOptionsTest() {
  describe('SliderCustomContentOptionsTest', () => {
    beforeAll(async (): Promise<void> => {
      console.info("SliderCustomContentOptionsTest beforeAll start");
      await UtilsTest.startAbility("com.arkui.ace.slider_static", "EntryAbility");
    });

    beforeEach(async (): Promise<void> => {
      console.info("SliderCustomContentOptionsTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/slider/SliderCustomContentOptionsIndex',
      };
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router;
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("SliderCustomContentOptionsTest state pages: " + JSON.stringify(pages));
        console.info("SliderCustomContentOptionsTest state pages.name: " + pages.name);
        if (pages.name !== "SliderCustomContentOptionsIndex") {
          routerInstance.replaceUrl(options);
        }
        await Utils.sleep(500);
      } catch (err) {
        console.error("SliderCustomContentOptionsTest replaceUrl error: " + err);
        expect().assertFail();
      }
    });

    afterEach(async () => {
      await Utils.sleep(SLEEP_TIME);
      console.info("SliderCustomContentOptionsTest after each called");
    });

    /**
     * @tc.number SliderCustomContentOptionsTest_001
     * @tc.name sliderCustomContentOptionsAccessibilityDescription
     * @tc.desc Test SliderCustomContentOptions accessibilityDescription property, read from component and print component tree
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('sliderCustomContentOptionsAccessibilityDescription', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('SliderCustomContentOptionsTest execute: sliderCustomContentOptionsAccessibilityDescription START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        const driver = Driver.create();
        const slider = await driver.findComponent(ON.id('sliderDescription'));
        expect(!!slider).assertEqual(true);
        let node = JSON.parseJsonElement(inspector.getInspectorByKey('sliderDescription'));
        logLongString('SliderCustomContentOptionsTest: sliderCustomContentAccessibilityDescription node =', JSON.stringifyJsonElement(node));
        expect(node != null).assertTrue();
        console.info('SliderCustomContentOptionsTest execute: sliderCustomContentOptionsAccessibilityDescription END');
        done();
      } catch (error) {
        console.error('SliderCustomContentOptionsTest execute: sliderCustomContentOptionsAccessibilityDescription error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SliderCustomContentOptionsTest_002
     * @tc.name sliderCustomContentOptionsAccessibilityLevel
     * @tc.desc Test SliderCustomContentOptions accessibilityLevel property, read from component and print component tree
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('sliderCustomContentOptionsAccessibilityLevel', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('SliderCustomContentOptionsTest execute: sliderCustomContentOptionsAccessibilityLevel START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        const driver = Driver.create();
        const slider = await driver.findComponent(ON.id('sliderLevel'));
        if(slider){
          console.info('SliderCustomContentOptionsTest sliderCustomContentOptionsAccessibilityLevel get slider success');
        }
        expect(!!slider).assertEqual(true);
        let node = JSON.parseJsonElement(inspector.getInspectorByKey('sliderLevel'));
        logLongString('SliderCustomContentOptionsTest: sliderCustomContentAccessibilityLevel node =', JSON.stringifyJsonElement(node));
        expect(node != null).assertTrue();
        let attrs = node.getElement('$attrs');
        let accessibilityLevel = attrs.getString('accessibilityLevel');
        expect(accessibilityLevel).assertEqual('auto');
        console.info('SliderCustomContentOptionsTest execute: sliderCustomContentOptionsAccessibilityLevel END');
        done();
      } catch (error) {
        console.error('SliderCustomContentOptionsTest execute: sliderCustomContentOptionsAccessibilityLevel error:' + error);
        expect().assertFail();
        done();
      }
    });
  });
}
