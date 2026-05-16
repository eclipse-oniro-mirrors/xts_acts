'use static';
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
import { describe, it, expect, beforeAll, beforeEach, afterEach, Level } from '../../../../hypium/index';
import { Driver, ON, Rect } from '@kit.TestKit';
import router from '@ohos.router';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test';
import CommonFunc from '../../../ets/MainAbility/common/Common';

const SLEEP_TIME = 1000;
const PAGE_URL = 'MainAbility/pages/ResponseRegion/ResponseRegionIndex';
const PAGE_NAME = 'ResponseRegionIndex';

export default function ResponseRegionTest() {
  describe('ResponseRegionTest', () => {
    beforeAll(async (): Promise<void> => {
      await UtilsTest.startAbility('com.arkui.ace.ets.module.common.static', 'EntryAbility');
    });

    beforeEach(async (): Promise<void> => {
      const options: router.RouterOptions = { url: PAGE_URL };
      const routerInstance = AppStorage.get<Router>('router') as Router;
      routerInstance.clear();
      routerInstance.replaceUrl(options);
      await CommonFunc.sleep(SLEEP_TIME);
      expect(routerInstance.getState().name).assertEqual(PAGE_NAME);
    });

    afterEach(async (): Promise<void> => {
      await CommonFunc.sleep(SLEEP_TIME);
    });

    /**
     * @tc.number responseRegionListTest_0100
     * @tc.name responseRegionListTest_0100
     * @tc.desc responseRegionListTest default []
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('responseRegionListTest_0100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        const driver = Driver.create();
        await CommonFunc.sleep(1000);
        const button = await driver.findComponent(ON.id('button1'));
        expect(button !== null).assertTrue();
        if (button === null) {
          throw new Error('button1 is null');
        }
        await (button.click() as Promise<void>);
        await CommonFunc.sleep(1000);
        expect(AppStorage.get<string>('click1') as string).assertEqual('button1 clicked');
      } catch (error) {
        console.error('responseRegionListTest_0100 error: ' + error);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.number responseRegionListTest_0200
     * @tc.name responseRegionListTest_0200
     * @tc.desc responseRegionListTest change responseRegion
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('responseRegionListTest_0200', Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        const driver = Driver.create();
        await CommonFunc.sleep(1000);
        const button = await driver.findComponent(ON.id('button2'));
        expect(button !== null).assertTrue();
        if (button === null) {
          throw new Error('button2 is null');
        }
        const rect = await (button?.getBounds() as Promise<Rect>)
        const clickX: int = Math.round(rect.right + (rect.right - rect.left) / 2).toInt();
        const clickY: int = Math.round(rect.top + (rect.bottom - rect.top) / 2).toInt();
        await driver.click(clickX, clickY);
        await CommonFunc.sleep(1000);
        expect(AppStorage.get<string>('click2') as string).assertEqual('button2 clicked');
      } catch (error) {
        console.error('responseRegionListTest_0200 error: ' + error);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.number responseRegionListTest_0300
     * @tc.name responseRegionListTest_0300
     * @tc.desc responseRegionListTest change responseRegion
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('responseRegionListTest_0300', Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        const driver = Driver.create();
        await CommonFunc.sleep(1000);
        const button = await driver.findComponent(ON.id('button3'));
        expect(button !== null).assertTrue();
        if (button === null) {
          throw new Error('button3 is null');
        }
        await (button.click() as Promise<void>);
        await CommonFunc.sleep(1000);
        expect(AppStorage.get<string>('click3') as string).assertEqual('button3 clicked');
      } catch (error) {
        console.error('responseRegionListTest_0300 error: ' + error);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.number responseRegionListTest_0400
     * @tc.name responseRegionListTest_0400
     * @tc.desc responseRegionListTest change responseRegion
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('responseRegionListTest_0400', Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        const driver = Driver.create();
        await CommonFunc.sleep(1000);
        const button = await driver.findComponent(ON.id('button4'));
        expect(button !== null).assertTrue();
        if (button === null) {
          throw new Error('button4 is null');
        }
        await (button.click() as Promise<void>);
        await CommonFunc.sleep(1000);
        expect(AppStorage.get<string>('click4') as string).assertEqual('button4 clicked');
      } catch (error) {
        console.error('responseRegionListTest_0400 error: ' + error);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.number responseRegionListTest_0500
     * @tc.name responseRegionListTest_0500
     * @tc.desc responseRegionListTest change responseRegion
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('responseRegionListTest_0500', Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        const driver = Driver.create();
        await CommonFunc.sleep(1000);
        const button = await driver.findComponent(ON.id('button5'));
        expect(button !== null).assertTrue();
        if (button === null) {
          throw new Error('button5 is null');
        }
        await (button.click() as Promise<void>);
        await CommonFunc.sleep(1000);
        expect(AppStorage.get<string>('click5') as string).assertEqual('button5 clicked');
      } catch (error) {
        console.error('responseRegionListTest_0500 error: ' + error);
        expect().assertFail();
      }
      done();
    });
  });
}
