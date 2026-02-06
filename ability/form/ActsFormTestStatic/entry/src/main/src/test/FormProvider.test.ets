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

import { describe, it, expect, TestType, Size, Level } from '../../../hypium/index';
import hilog from '@ohos.hilog';
import { BusinessError } from '@ohos.base';
import formProvider from "@ohos.app.form.formProvider";
import Utils from './Util.test';


const DOMAIN: number = 0x0000;
const TAG: string = 'testTag formProviderTest';

export default function formProviderTest() {
    describe("formProviderTest", (): void => {
        hilog.info(DOMAIN, TAG, 'formProviderTest describe start');

        /**
         * @tc.number: FormProviderStaticTest001
         * @tc.name: FormProviderStaticTest001
         * @tc.desc: check FormProvider
         */
        it("FormProviderStaticTest001", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
            await Utils.msSleep(1000);
            hilog.info(DOMAIN, TAG, 'FormProviderStaticTest001 start');

            let formId: string = '3610022740'; //用hap包装好的应用的卡片id
            try {
                formProvider.setFormNextRefreshTime(formId, 2, (error: BusinessError | null) => {
                    if (error?.code) {
                        hilog.info(DOMAIN, TAG, `FormProviderStaticTest001 callback error, code:${error?.code}`);
                    }
                    hilog.info(DOMAIN, TAG, 'FormProviderStaticTest001 setFormNextRefreshTime callback success');
                });
                hilog.info(DOMAIN, TAG, 'FormProviderStaticTest001 setFormNextRefreshTime register success');
                expect(true).assertTrue();
                done();
            } catch (error) {
                hilog.error(DOMAIN, TAG, 'FormProviderStaticTest001 catch error');
                expect().assertFail();
                done();
            }

            hilog.info(DOMAIN, TAG, 'FormProviderStaticTest001 end');
        })

        /**
         * @tc.number: FormProviderStaticTest002
         * @tc.name: FormProviderStaticTest002
         * @tc.desc: check FormProvider
         */
        it("FormProviderStaticTest002", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
            await Utils.msSleep(1000);
            hilog.info(DOMAIN, TAG, 'FormProviderStaticTest002 start');
            let formId2: string = '21347330770'; //用hap包装好的应用的卡片id
            try {
                formProvider.setFormNextRefreshTime(formId2, 3).then(() => {
                    hilog.info(DOMAIN, TAG, `FormProviderStaticTest002 setFormNextRefreshTime success`);
                }).catch((error) => {
                    hilog.error(DOMAIN, TAG, `FormProviderStaticTest002 promise error, code:`);
                });
                hilog.info(DOMAIN, TAG, 'FormProviderStaticTest002 setFormNextRefreshTime register success');
                expect(true).assertTrue();
                done();
            } catch (error) {
                hilog.error(DOMAIN, TAG, `FormProviderStaticTest002 catch error, code: `);
                expect().assertFail();
                done();
            }

            hilog.info(DOMAIN, TAG, 'FormProviderStaticTest002 end');
        })
    })
}