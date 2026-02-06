'use static';
/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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

import { describe, it, expect, beforeAll, afterEach, Level, beforeEach } from '../../../../hypium/index';
import { abilityDelegatorRegistry, Driver, ON } from '@kit.TestKit';
import router from '@ohos.router';
import Utils from '../../../ets/MainAbility/common/Utils';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector';
import { UtilsTest } from '../Util.test';


export default function textClockFormatTest() {
  describe('textClockFormatTest', () => {
    beforeAll(() => {
      console.info("TextClockFormatTest beforeAll start");
      await UtilsTest.startAbility("com.arkui.ace.information02.static", "EntryAbility")
    });
    beforeEach(async (): Promise<void> => {
      console.info("TextClockFormatTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/TextClock/TextClockFormat',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get TextClockFormatTest state pages:" + JSON.stringify(pages));
        if (!("TextClockFormat" == pages.name)) {
          console.info("get TextClockFormatTest pages.name:" + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(1000);
        }
      } catch (err) {
        console.error("push TextClockFormatTest page error:" + err);
      }
      console.info("TextClockFormatTest beforeEach end");
    });
    afterEach(async () => {
      await Utils.sleep(1000);
      console.info("TextClockFormatTest after each called");
    });

    /**
     * @tc.name   textClockTest01
     * @tc.number textClockTest01
     * @tc.desc   test fontWeight
     * @tc.level  Level.LEVEL0
     */
    it('textClockTest01', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[textClockTest01] START');
      await Utils.sleep(1000);
      let strJson = inspector.getInspectorByKey('format_resource');
      console.info("[textClockTest01] JSON.parse(strJson) is: " + JSON.stringify(JSON.parseJsonElement(strJson)));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('format')).assertEqual('yyyy-M-d');
      console.info('textClockTest01 END');

      console.info('[textClockTest01] START');
      await Utils.sleep(1000);
      let strJson1: string = inspector.getInspectorByKey('format_resource1');
      console.info("[textClockTest01] JSON.parse(strJson) is: " + JSON.stringify(JSON.parseJsonElement(strJson1)));
      expect(JSON.parseJsonElement(strJson1).getElement('$attrs').getString('format')).assertEqual('yyyy-M-d');
      console.info('textClockTest01 END');
      done();
    });

    /**
     * @tc.name   textClockTest02
     * @tc.number textClockTest02
     * @tc.desc   test fontWeight
     * @tc.level  Level.LEVEL0
     */
    it('textClockTest02', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[textClockTest02] START');
      await Utils.sleep(1000);
      let strJson: string = inspector.getInspectorByKey('format_yyyy');
      console.info("[textClockTest02] JSON.parse(strJson) is: " + JSON.stringify(JSON.parseJsonElement(strJson)));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('format')).assertEqual('yyyy-M-d');
      console.info('textClockTest02 END');

      console.info('[textClockTest02] START');
      await Utils.sleep(1000);
      let strJson1: string = inspector.getInspectorByKey('format_yyyy1');
      console.info("[textClockTest02] JSON.parse(strJson) is: " + JSON.stringify(JSON.parseJsonElement(strJson1)));
      expect(JSON.parseJsonElement(strJson1).getElement('$attrs').getString('format')).assertEqual('yyyy-M-d');
      console.info('textClockTest02 END');
      done();
    });

    /**
     * @tc.name   textClockTest03
     * @tc.number textClockTest03
     * @tc.desc   test fontWeight
     * @tc.level  Level.LEVEL0
     */
    it('textClockTest03', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[textClockTest03] START');
      await Utils.sleep(1000);
      let strJson: string = inspector.getInspectorByKey('format_aa_hh');
      console.info("[textClockTest03] JSON.parse(strJson) is: " + JSON.stringify(JSON.parseJsonElement(strJson)));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('format')).assertEqual('aa hh:mm:ss');
      console.info('textClockTest03 END');

      console.info('[textClockTest03] START');
      await Utils.sleep(1000);
      let strJson1: string = inspector.getInspectorByKey('format_aa_hh1');
      console.info("[textClockTest03] JSON.parse(strJson) is: " + JSON.stringify(JSON.parseJsonElement(strJson1)));
      expect(JSON.parseJsonElement(strJson1).getElement('$attrs').getString('format')).assertEqual('aa hh:mm:ss');
      console.info('textClockTest03 END');
      done();
    });

    /**
     * @tc.name   textClockTest04
     * @tc.number textClockTest04
     * @tc.desc   test fontWeight
     * @tc.level  Level.LEVEL0
     */
    it('textClockTest04', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[textClockTest04] START');
      await Utils.sleep(1000);
      let strJson: string = inspector.getInspectorByKey('format_undefined');
      console.info("[textClockTest04] JSON.parse(strJson) is: " + JSON.stringify(JSON.parseJsonElement(strJson)));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('format')).assertEqual('aa hh:mm:ss');
      console.info('textClockTest04 END');

      console.info('[textClockTest04] START');
      await Utils.sleep(1000);
      let strJson1: string = inspector.getInspectorByKey('format_undefined1');
      console.info("[textClockTest04] JSON.parse(strJson) is: " + JSON.stringify(JSON.parseJsonElement(strJson1)));
      expect(JSON.parseJsonElement(strJson1).getElement('$attrs').getString('format')).assertEqual('aa hh:mm:ss');
      console.info('textClockTest04 END');
      done();
    });

  })
}
