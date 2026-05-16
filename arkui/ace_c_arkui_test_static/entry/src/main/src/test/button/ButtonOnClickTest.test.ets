'use static';
/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
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

import { beforeEach, describe, expect, it, Level, beforeAll } from '../../../../hypium';
import Utils from '../common/Utils';
import {LibUtil} from '../../../ets/pages/LibUtil'
import inspector from '@ohos.arkui.inspector';
import { UtilsTest } from '../Util.test'
let libUtil:LibUtil = new LibUtil();

export default function buttonOnClickTest() {

  describe('ButtonOnClickTest', () => {

    let PAGE_TAG = 'ButtonOnClickTest';

    beforeAll(async () => {
      await UtilsTest.startAbility("com.openharmony.arkui_ani_test.static", "EntryAbility");
      await Utils.pushPage(`button/${PAGE_TAG}`, false);
    });

    
    
/**
     * @tc.number   testButtonOnClick001
     * @tc.name     testButtonOnClick001
     * @tc.desc     testButtonOnClick001
     * @tc.level    Level.LEVEL1
     */
    it('testButtonOnClick001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      await Utils.clickComponent('OnClickTestButton')
      await Utils.sleep(2000)
      let strJson = inspector.getInspectorByKey('OnClickTestButton');
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getElement('$attrs').getString('backgroundColor')).assertEqual('#FF00FF00')
      done()
    })

    
    
/**
     * @tc.number   testButtonOnClick002
     * @tc.name     testButtonOnClick002
     * @tc.desc     testButtonOnClick002
     * @tc.level    Level.LEVEL1
     */
    it('testButtonOnClick002', Level.LEVEL1, async (done: () => void): Promise<void> => {
      await Utils.clickComponent('OnClickTestButtonDisable')
      await Utils.sleep(2000)
      let strJson = inspector.getInspectorByKey('OnClickTestButtonDisable');
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getElement('$attrs').getString('backgroundColor')).assertEqual('#FFFF0000')
      done()
    })

  })
}
