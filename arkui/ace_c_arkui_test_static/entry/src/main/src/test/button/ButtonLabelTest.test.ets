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

export default function buttonLabelTest() {

  describe('ButtonLabelTest', () => {

    beforeAll(() => {
      await UtilsTest.startAbility("com.openharmony.arkui_ani_test.static", "EntryAbility");
    });

    beforeEach(async () => {
      await Utils.sleep(100);
    });

    
    
/**
     * @tc.number   testButtonLabel001
     * @tc.name     testButtonLabel001
     * @tc.desc     testButtonLabel001
     * @tc.level    Level.LEVEL1
     */
    it('testButtonLabel001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      let PAGE_TAG = 'ButtonLabel001Test';
      await Utils.pushPage(`button/${PAGE_TAG}`);
      expect(JSON.parseJsonElement(inspector.getInspectorByKey('button001')).getElement('$attrs').getString('label')).assertEqual('label')
      done()
    })

    
    
/**
     * @tc.number   testButtonLabel002
     * @tc.name     testButtonLabel002
     * @tc.desc     testButtonLabel002
     * @tc.level    Level.LEVEL1
     */
    it('testButtonLabel002', Level.LEVEL1, async (done: () => void): Promise<void> => {
      let PAGE_TAG = 'ButtonLabel002Test';
      await Utils.pushPage(`button/${PAGE_TAG}`);
      expect(JSON.parseJsonElement(inspector.getInspectorByKey('button002')).getElement('$attrs').getString('label')).assertEqual('longlonglonglonglonglonglonglong' +
        'longlonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglong')
      done()
    })

    
    
/**
     * @tc.number   testButtonLabel003
     * @tc.name     testButtonLabel003
     * @tc.desc     testButtonLabel003
     * @tc.level    Level.LEVEL1
     */
    it('testButtonLabel003', Level.LEVEL1, async (done: () => void): Promise<void> => {
      let PAGE_TAG = 'ButtonLabel003Test';
      await Utils.pushPage(`button/${PAGE_TAG}`);
      expect(JSON.parseJsonElement(inspector.getInspectorByKey('button003')).getElement('$attrs').getString('label')).assertEqual('')
      done()
    })

    
    
/**
     * @tc.number   testButtonLabel004
     * @tc.name     testButtonLabel004
     * @tc.desc     testButtonLabel004
     * @tc.level    Level.LEVEL1
     */
    it('testButtonLabel004', Level.LEVEL1, async (done: () => void): Promise<void> => {
      let PAGE_TAG = 'ButtonLabel004Test';
      await Utils.pushPage(`button/${PAGE_TAG}`);
      expect(JSON.parseJsonElement(inspector.getInspectorByKey('button004')).getElement('$attrs').getString('width')).assertEqual('100.00vp')
      done()
    })

  })
}