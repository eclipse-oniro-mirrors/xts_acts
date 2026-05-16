/*
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
import { display } from '@kit.ArkUI';
import { BusinessError } from '@ohos.base';

@Entry
@Component
struct GetSurfaceId {
    xComponentController: XComponentController = new XComponentController();
    @State message: string = '';
    @State vid: number = 0;
    @State text: string = '';
    private caseName = 'test_MakeUnique_01 inPage';
    
    build() {
        Column() {
            Row(){
            Text(this.message).id('testResult')
            Text(this.vid.toString()).id('screenId')
        }

        Column() {
            XComponent({
                type: XComponentType.SURFACE,
                controller: this.xComponentController
            })
        }.width('100%').height('50%')

        Button('创建虚拟屏')
            .id('button')
            .onClick(() => {
                try {
                    display.createVirtualScreen({
                    name: 'CommonScbScreen',
                    width: 1080,
                    height: 2720,
                    density: 2,
                    surfaceId: ''
                }).then(async (displayId: number) => {
                    this.vid = displayId;

                    // 设置虚拟屏surfaceid
                    let surfaceId = this.xComponentController.getXComponentSurfaceId();
                    await display.setVirtualScreenSurface(this.vid, surfaceId).then(() => {
                        console.log(this.caseName + 'succeeded in setVirtualScreenSurface');
                    }).catch((err: BusinessError) => {
                        console.log(this.caseName + 'Failed in setVirtualScreenSurface, err: ' + JSON.stringify(err));
                    })

                    // 虚拟屏设置异源屏
                    display.makeUnique(this.vid).then(async () => {
                        console.log(this.caseName + 'succeeded in makeUnique');
                        this.message = 'success';
                    }).catch((err: BusinessError) => {
                        console.log(this.caseName + 'failed in makeUnique, err : ' + JSON.stringify(err));
                        this.message = 'fail';
                    })
                })
                } catch (err) {
                    console.log(this.caseName + 'Failed in createVirtualScreen, err : ' + JSON.stringify(err));
                    if (err.code == 801) {
                        this.message = 'not support';
                    } else {
                        this.message = 'fail';
                    }
                }
            })
        }

    }
}