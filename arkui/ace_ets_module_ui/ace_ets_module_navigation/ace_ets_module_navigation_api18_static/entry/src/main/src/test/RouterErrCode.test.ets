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
import {
  describe,
  beforeAll,
  expect,
  beforeEach,
  afterEach,
  afterAll,
  it,
  expect,
  Level
} from '../../../hypium/index';
import router from '@ohos.router';
import { UtilsTest } from './Util.test';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector';
import { Driver, ON,Component } from '@ohos.UiTest';
import CommonFunc from '../../ets/MainAbility/common/Common';
import events_emitter from '@ohos.events.emitter'
import { BusinessError } from '@ohos.base';
import router from '@ohos.router';

export default function RouterErrCode() {
  describe('RouterErrCode', () => {
    beforeAll(async (): Promise<void> => {

      await UtilsTest.startAbility("com.arkui.ace.navigation18.static", "EntryAbility")

    });
    beforeEach(async (): Promise<void> => {
      console.info('RouterErrCode beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/RouterErrCode',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info('get RouterErrCode state pages:' + JSON.stringify(pages));
        if (!('RouterErrCode' == pages.name)) {
          console.info('get RouterErrCode pages.name:' + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error('push RouterErrCode page error:' + err);
      }
      console.info('RouterErrCode beforeEach end');
    });

    afterEach(async (): Promise<void> => {
      await CommonFunc.sleep(1000);
      console.info('RouterErrCode after each called');
    });

    /**
     * @tc.name   RouterErrCode_static_0100
     * @tc.number SUB_ARKUI_ROUTERERRCODE_STATIC_0100
     * @tc.desc   The errcode property of the pushUrl set 100002.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('RouterErrCode_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('RouterErrCode_static_0100 START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      let btn1 = await driver.findComponent(ON.id('pushUrl_err'));
      await (btn1?.click() as Promise<void>)
      console.info('[RouterErrCode_static_0100] btn1 click');
      await CommonFunc.sleep(1500);

      let pushUrl_errCode = AppStorage.get<Int>('pushUrl_err')
      console.log('RouterErrCode_static_0100 pushUrl_errCode value : ' + pushUrl_errCode)
      expect(pushUrl_errCode).assertEqual(100002);
      AppStorage.delete('pushUrl_err');
      console.info('[RouterErrCode_static_0100] END');
      done();
    });

    /**
     * @tc.name   RouterErrCode_static_0200
     * @tc.number SUB_ARKUI_ROUTERERRCODE_STATIC_0200
     * @tc.desc   The errcode property of the replaceUrl set 200002.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('RouterErrCode_static_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('RouterErrCode_static_0200 START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      let btn1 = await driver.findComponent(ON.id('replaceUrl_err'));
      await (btn1?.click() as Promise<void>)
      console.info('[RouterErrCode_static_0200] btn1 click');
      await CommonFunc.sleep(1500);

      let replaceUrl_errCode = AppStorage.get<Int>('replaceUrl_err')
      console.log('RouterErrCode_static_0200 replaceUrl_errCode value : ' + replaceUrl_errCode)
      expect(replaceUrl_errCode).assertEqual(200002);
      AppStorage.delete('replaceUrl_err');
      console.info('[RouterErrCode_static_0200] END');
      done();
    });
  })
}