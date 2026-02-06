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
import { UtilsTest } from '../Util.test'
let libUtil:LibUtil = new LibUtil();

export default function commonAttrsExpandSafeAreaTest() {

  describe('CommonAttrsExpandSafeAreaTest', () => {

    beforeAll(() => {
      await UtilsTest.startAbility("com.openharmony.arkui_ani_test.static", "EntryAbility");
    });

    beforeEach(async () => {
      await Utils.sleep(100);
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_COLUMN_EXPANDSAFEAREA_0100
     * @tc.name       : testCommonAttrsExpandSafeArea001
     * @tc.desc       : testing expandsafearea for commonAttrs with valid value
                        {ARKUI_SAFE_AREA_TYPE_SYSTEM}{ARKUI_SAFE_AREA_EDGE_TOP} 
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level1
     */
    
/**
     * @tc.number   testCommonAttrsExpandSafeArea001
     * @tc.name     testCommonAttrsExpandSafeArea001
     * @tc.desc     testCommonAttrsExpandSafeArea001
     * @tc.level    Level.LEVEL1
     */
    it('testCommonAttrsExpandSafeArea001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCommonAttrsExpandSafeArea001()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_COLUMN_EXPANDSAFEAREA_0200
     * @tc.name       : testCommonAttrsExpandSafeArea002
     * @tc.desc       : testing expandsafearea for commonAttrs with valid value
                        0,0 
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level1
     */
    
/**
     * @tc.number   testCommonAttrsExpandSafeArea002
     * @tc.name     testCommonAttrsExpandSafeArea002
     * @tc.desc     testCommonAttrsExpandSafeArea002
     * @tc.level    Level.LEVEL1
     */
    it('testCommonAttrsExpandSafeArea002', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCommonAttrsExpandSafeArea002()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_COLUMN_EXPANDSAFEAREA_0300
     * @tc.name       : testCommonAttrsExpandSafeArea003
     * @tc.desc       : testing expandsafearea for commonAttrs with valid value
                        5,9
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level1
     */
    
/**
     * @tc.number   testCommonAttrsExpandSafeArea003
     * @tc.name     testCommonAttrsExpandSafeArea003
     * @tc.desc     testCommonAttrsExpandSafeArea003
     * @tc.level    Level.LEVEL1
     */
    it('testCommonAttrsExpandSafeArea003', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCommonAttrsExpandSafeArea003()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCommonAttrsExpandSafeArea004
     * @tc.name     testCommonAttrsExpandSafeArea004
     * @tc.desc     testCommonAttrsExpandSafeArea004
     * @tc.level    Level.LEVEL1
     */
    it('testCommonAttrsExpandSafeArea004', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCommonAttrsExpandSafeArea004()).assertEqual(0)
      done()
    })
  })
}