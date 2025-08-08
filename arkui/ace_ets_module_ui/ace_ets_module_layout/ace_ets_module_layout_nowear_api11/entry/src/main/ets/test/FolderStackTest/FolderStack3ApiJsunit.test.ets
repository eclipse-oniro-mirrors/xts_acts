/**
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "@ohos/hypium"
import router from '@ohos.router';
import {UiComponent, UiDriver, Component, Driver, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/utils/Common';
import {MessageManager,Callback} from '../../MainAbility/utils/MessageManager';

export default function FolderStack3ApiJsunit() {
  describe('FolderStack3ApiJsunit', () => {
    beforeEach(async (done: Function) => {
      console.info("FolderStack3ApiJsunit beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/FolderStack/FolderStack3Api',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get FolderStack3ApiJsunit state pages:" + JSON.stringify(pages));
        if (!("FolderStack3Api" == pages.name)) {
          console.info("get FolderStack3ApiJsunit state pages.name:" + JSON.stringify(pages.name));
          let result = await router.push(options);
          console.info("push FolderStack3ApiJsunit success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push FolderStack3ApiJsunit page error:" + err);
        expect().assertFail();
      }
      done();
    });
    it('FolderStack3ApiJsunit_0100',  Level.LEVEL0, async (done: Function) => {
        await CommonFunc.sleep(1000);
        console.info('FolderStack3ApiJsunit_0100 START');
        let strcontent = getInspectorByKey('FolderStack3ApiTestFolderStack');
        let obj: ESObject = JSON.parse(strcontent);
        await CommonFunc.sleep(1000);
        console.info('FolderStack3ApiJsunit_0100 component obj is: ' + obj.$attrs.enableAnimation);
        expect(obj.$attrs.enableAnimation).assertEqual('true');
        console.info('FolderStack3ApiJsunit_0100 END')
        done();
      });
    it('FolderStack3ApiJsunit_0200',  Level.LEVEL0, async (done: Function) => {
      await CommonFunc.sleep(1000);
      console.info('FolderStack3ApiJsunit_0200 START');
      let strcontent = getInspectorByKey('FolderStack3ApiTestFolderStack');
      let obj: ESObject = JSON.parse(strcontent);
      await CommonFunc.sleep(1000);
      console.info('FolderStack3ApiJsunit_0200 component obj is: ' + obj.$attrs.autoHalfFold);
      expect(obj.$attrs.autoHalfFold).assertEqual('true');
      console.info('FolderStack3ApiJsunit_0200 END')
      done();
    });
    it('FolderStack3ApiJsunit_0300',  Level.LEVEL0, async (done: Function) => {
      await CommonFunc.sleep(1000);
      console.info('FolderStack3ApiJsunit_0300 START');
      let strcontent = getInspectorByKey('FolderStack3ApiTestText');
      let obj: ESObject = JSON.parse(strcontent);
      await CommonFunc.sleep(1000);
      console.info('FolderStack3ApiJsunit_0300 component obj is: ' + obj.$attrs.content);
      expect(obj.$attrs.content).assertEqual('start');
      console.info('FolderStack3ApiJsunit_0300 END')
      done();
    });

  })
}