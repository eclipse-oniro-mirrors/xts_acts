/*
 * Copyright (c) 2021 Huawei Device Co., Ltd.
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

import { describe, it, expect, Level } from '@ohos/hypium'
import resourceManager from '@ohos.resourceManager';
import { BusinessError } from '@ohos.base';

export default function actsFa8ContextTest() {
    describe('ActsFa8ContextTest', () => {
        /*
        * @tc.number    : ACTS_FA8Context_0100
        * @tc.name      : get resource by $r
        * @tc.desc      : get resource by $r
        */
        it('ACTS_FA8Context_0100', Level.LEVEL0, async (done: Function) => {
            await resourceManager.getResourceManager().then(rm => {
                return rm.getString($r("app.string.fa").id)
            }).then(str => {
                console.info("ACTS_FA8Context_0100 str: " + str)
                expect(str).assertEqual("fa_name")
                done()
            }).catch((err:BusinessError) => {
                console.info("ACTS_FA8Context_0100 err: " + err)
                expect().assertFail()
                done();
            })
        })
    })
}