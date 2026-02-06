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
import {
  describe,
  beforeAll,
  beforeEach,
  afterEach,
  afterAll,
  it,
  expect,
  Level
} from '../../../../hypium/index'
import {
  Component,
  Driver,
  UiWindow,
  ON,
  MatchPattern,
  DisplayRotation,
  ResizeDirection,
  WindowMode,
  PointerMatrix
} from '@ohos.UiTest';
import { MessageManager, Callback } from '../../../ets/MainAbility/utils/MessageManager';
import inspector from '@ohos.arkui.inspector'
import CommonFunc from '../../../ets/MainAbility/common/Common';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import router from '@ohos.router';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test';

let domain: Int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext: common.UIAbilityContext;

export default function FolderStack3ApiJsunit() {
  describe('FolderStack3ApiJsunit', () => {
    beforeAll(() => {
      console.info("FolderStack3ApiJsunit beforeAll start");

      await UtilsTest.startAbility("com.arkui.ace.layout.nowear.api11.static", "EntryAbility")
    });

    beforeEach(async (): Promise<void> => {
      console.info("FolderStack3ApiJsunit beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/FolderStack/FolderStack3Api',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get FolderStack3ApiJsunit state pages:" + "");
        if (!("ColumnSpaceResourcePage" == pages.name)) {
          console.info("get FolderStack3ApiJsunit pages.name:" + "");
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push FolderStack3ApiJsunit page error:" + err);
      }
      console.info("FolderStack3ApiJsunit beforeEach end");
    });

    /**
     * @tc.number   FolderStack3ApiJsunit_static_0100
     * @tc.name     FolderStack3ApiJsunit_static_0100
     * @tc.desc     FolderStack3ApiJsunit_static_0100
     * @tc.level    0
     */
    it('FolderStack3ApiJsunit_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      await CommonFunc.sleep(1000);
      console.info('FolderStack3ApiJsunit_0100 START');
      let strcontent = inspector.getInspectorByKey('FolderStack3ApiTestFolderStack');
      let obj = JSON.parseJsonElement(strcontent);
      await CommonFunc.sleep(1000);
      console.info('FolderStack3ApiJsunit_0100 component obj is: ' +
      obj.getElement('$attrs').getString('enableAnimation'));
      expect(obj.getElement('$attrs').getString('enableAnimation')).assertEqual('true');
      console.info('FolderStack3ApiJsunit_0100 END')
      done();
    });
    /**
     * @tc.number   FolderStack3ApiJsunit_static_0200
     * @tc.name     FolderStack3ApiJsunit_static_0200
     * @tc.desc     FolderStack3ApiJsunit_static_0200
     * @tc.level    0
     */
    it('FolderStack3ApiJsunit_static_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      await CommonFunc.sleep(1000);
      console.info('FolderStack3ApiJsunit_0200 START');
      let strcontent = inspector.getInspectorByKey('FolderStack3ApiTestFolderStack');
      let obj = JSON.parseJsonElement(strcontent);
      await CommonFunc.sleep(1000);
      console.info('FolderStack3ApiJsunit_0200 component obj is: ' +
      obj.getElement('$attrs').getString('autoHalfFold'));
      expect(obj.getElement('$attrs').getString('autoHalfFold')).assertEqual('true');
      console.info('FolderStack3ApiJsunit_0200 END')
      done();
    });
    /**
     * @tc.number   FolderStack3ApiJsunit_static_0300
     * @tc.name     FolderStack3ApiJsunit_static_0300
     * @tc.desc     FolderStack3ApiJsunit_static_0300
     * @tc.level    0
     */
    it('FolderStack3ApiJsunit_static_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      await CommonFunc.sleep(1000);
      console.info('FolderStack3ApiJsunit_0300 START');
      let strcontent = inspector.getInspectorByKey('FolderStack3ApiTestText');
      let obj = JSON.parseJsonElement(strcontent);
      await CommonFunc.sleep(1000);
      console.info('FolderStack3ApiJsunit_0300 component obj is: ' + obj.getElement('$attrs').getString('content'));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('start');
      console.info('FolderStack3ApiJsunit_0300 END')
      done();
    });

  })
}