/*
 * Copyright (C) 2024 Huawei Device Co., Ltd.
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
import hilog from '@ohos.hilog';
import { wantConstant } from '@kit.AbilityKit';
import commonEventManager from '@ohos.commonEventManager'

const TAG = 'MuseEditorExtensionAbility';

@Entry
@Component
struct Index {
    aboutToAppear() {
        hilog.info(0x0000, 'testTag', '%{public}s', 'TestAbility index aboutToAppear');
    }

    @State message: string = 'Hello World'

    build() {
        Row() {
            Column() {
                UIExtensionComponent({
                    bundleName: 'com.acts.photoeditorextensiontest',
                    abilityName: 'MuseEditorExtensionAbility',
                    flags: wantConstant.Flags.FLAG_AUTH_READ_URI_PERMISSION,
                    parameters: {
                        'ability.params.stream': 'file://com.wh.photoeditorcaller/data/storage/el2/base/haps/entry/files/source-1722067686453.jpg',
                        'ability.want.params.uiExtensionType': 'photoEditor'
                    }
                }).width('100%').height('100%')
                    .onRemoteReady((data) => {
                        let onResultEvent: string = 'ACTS_PhotoEditorExtension_OnRemoteReady';
                        let options: commonEventManager.CommonEventPublishData = {
                            parameters: {
                                'result': data
                            }
                        }
                        commonEventManager.publish(onResultEvent, options, (err) => {
                            console.log(TAG + 'ACTS_PhotoEditorExtension_OnRemoteReady');
                        });
                    })
            }
            .width('100%')
        }
        .height('100%')
    }
}