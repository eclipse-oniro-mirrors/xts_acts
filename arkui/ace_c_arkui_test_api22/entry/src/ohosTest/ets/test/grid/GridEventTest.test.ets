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

import { beforeAll, describe, expect, it, Level ,afterEach} from '@ohos/hypium';
import Utils from '../common/Utils';
import { Driver } from '@kit.TestKit';
import nativeRender from 'libnativerender.so'

export default function gridEventTest() {

  describe('GridEventTest', () => {
    afterEach(async (done: Function) => {
      done();
    })
    /**
     * @tc.number   testGridOnScrollIndex001
     * @tc.name     testGridOnScrollIndex001
     * @tc.desc     Normal value testing of itemFillPolicy interface
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 1
     */
    it('testGridOnScrollIndex001', Level.LEVEL1, async (done: Function) => {
      await Utils.pushPage(`grid/GridOnScrollIndexTest`);
      await Utils.sleep(1500)
      await Utils.scrollToBottomComponent('GridComponentTest5')
      await Utils.sleep(1500)
      let strJson = getInspectorByKey('GridComponentTest5');
      let obj: ESObject = JSON.parse(strJson);
      expect(obj.$attrs.backgroundColor).assertEqual('#12345678');
      done()
      done()
    })
    /**
     * @tc.number   testGridOnDidScroll001
     * @tc.name     testGridOnDidScroll001
     * @tc.desc     Normal value testing of itemFillPolicy interface
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 1
     */
    it('testGridOnDidScroll001', Level.LEVEL1, async (done: Function) => {
      await Utils.pushPage(`grid/GridOnDidScrollTest`);
      await Utils.sleep(1500)
      await Utils.scrollToBottomComponent('GridComponentTest')
      await Utils.sleep(1500)
      let strJson = getInspectorByKey('GridComponentTest');
      let obj: ESObject = JSON.parse(strJson);
      expect(obj.$attrs.backgroundColor).assertEqual('#FFFF11FF');
      done()
    })
    /**
     * @tc.number   testGridOnScrollBarUpdate001
     * @tc.name     testGridOnScrollBarUpdate001
     * @tc.desc     Normal value testing of itemFillPolicy interface
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 1
     */
    it('testGridOnScrollBarUpdate001', Level.LEVEL1, async (done: Function) => {
      await Utils.pushPage(`grid/GridOnScrollBarUpdateTest`);
      await Utils.scrollToBottomComponent('GridComponentTest6')
      await Utils.sleep(1500)
      let strJson = getInspectorByKey('GridComponentTest6');
      let obj: ESObject = JSON.parse(strJson);
      expect(obj.$attrs.backgroundColor).assertEqual('#FFFFFF00');
      done()
    })
    /**
     * @tc.number   testGridOnWillScroll001
     * @tc.name     testGridOnWillScroll001
     * @tc.desc     Normal value testing of itemFillPolicy interface
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 1
     */
    it('testGridOnWillScroll001', Level.LEVEL1, async (done: Function) => {
      await Utils.pushPage(`grid/GridOnWillScrollTest`);
      await Utils.scrollToBottomComponent('GridComponentTest3')
      await Utils.sleep(1500)
      let strJson = getInspectorByKey('GridComponentTest3');
      let obj: ESObject = JSON.parse(strJson);
      expect(obj.$attrs.backgroundColor).assertEqual('#21331211');
      done()
    })

  })
}