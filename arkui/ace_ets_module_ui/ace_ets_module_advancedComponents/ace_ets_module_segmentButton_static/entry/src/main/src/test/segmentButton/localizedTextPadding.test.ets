'use static';
/**
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

import {
  describe,
  beforeAll,
  beforeEach,
  afterEach,
  afterAll,
  it,
  expect,
  TestType,
  Size,
  Level
} from '../../../../hypium';
import { Driver, ON } from '@ohos.UiTest';
import router from '@ohos.router';
import Utils from '../../../ets/MainAbility/common/Utils';
import { UtilsTest, startAbility } from '../Util.test';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import inspector from '@ohos.arkui.inspector';

export default function localizedTextPadding() {
  describe('localizedTextPadding', () => {
    beforeAll(async (): Promise<void> => {
      console.info("localizedTextPadding beforeEach start");
      await UtilsTest.startAbility("com.arkui.ace.advanced.segmentButton.static", "EntryAbility")

    });

    beforeEach(async (): Promise<void> => {
      console.info("localizedTextPadding beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/segmentButton/localizedTextPadding',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get localizedTextPadding state pages:" + JSON.stringify(pages));
        if (!("localizedTextPadding" == pages.name)) {
          console.info("get localizedTextPadding pages.name:" + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push localizedTextPadding page error:" + err);
        expect().assertFail();
      }
      console.info("localizedTextPadding beforeEach end");
    });

    afterEach(async (): Promise<void> => {
      await CommonFunc.sleep(1000);
      console.info('localizedTextPadding after each called');
    });


    /**
     * @tc.name   localizedTextPadding_0100
     * @tc.number localizedTextPadding_0100
     * @tc.desc   api
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('localizedTextPadding_0100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('localizedTextPadding_0100 START');
      await CommonFunc.sleep(1000);
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(200);
      let btn = await driver.findComponent(ON.id('localizedTextPadding_start'));
      await CommonFunc.sleep(200);
      await (btn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let mText = inspector.getInspectorByKey("localizedTextPadding_start");
      console.log("[localizedTextPadding_0100] attrs is: ", JSON.stringify(JSON.parseJsonElement(mText)));
      expect(JSON.parseJsonElement(mText).getElement('$attrs').getString('label'))
        .assertEqual('start:{"unit":1,"value":20}');
      console.info('[localizedTextPadding_0100] END');
      done();
    });
    /**
     * @tc.name   localizedTextPadding_0200
     * @tc.number localizedTextPadding_0200
     * @tc.desc   api
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('localizedTextPadding_0200', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('localizedTextPadding_0200 START');
      await CommonFunc.sleep(1000);
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(200);
      let btn = await driver.findComponent(ON.id('localizedTextPadding_end'));
      await CommonFunc.sleep(200);
      await (btn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let mText2 = inspector.getInspectorByKey("localizedTextPadding_end");
      console.log("[localizedTextPadding_0200] attrs is: ", JSON.stringify(JSON.parseJsonElement(mText2)));
      expect(JSON.parseJsonElement(mText2).getElement('$attrs').getString('label'))
        .assertEqual('end:{"unit":1,"value":30}');
      console.info('[localizedTextPadding_0200] END');
      done();
    });

  })
}