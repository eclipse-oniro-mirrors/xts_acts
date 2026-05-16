 /*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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
 
 import nativeNode from "libnativeNode.so";
 	 import { UIContext } from '@ohos.arkui.UIContext';
 	 import image from '@ohos.multimedia.image';
 	 
 	 @Entry
 	 @Component
 	 struct orphanCharOptimizationTest {
 	   PAGE_TAG: string = 'orphanCharOptimizationTest';
 	   @Builder
 	   DraggingBuilder() {
 	     Column() {
 	       Text("hello")
 	     }
 	   }
 	 
 	   @State value: number = 40
 	   @State width1: string = '100%'
 	   @State _pixelMap: image.PixelMap|undefined = undefined;
 	 
 	   build() {
 	     Column() {
 	       Text('start Drag')
 	         .fontSize(18)
 	         .width('100%')
 	         .height(40)
 	         .margin(10)
 	         .backgroundColor('#008888')
 	       XComponent({
 	         id: 'dragStart',
 	         type: "node",
 	         libraryname: 'nativeNode'
 	       })
 	         .onAppear(() => {
 	           nativeNode.createNativeNode("dragStart", this.getUIContext());
 	         })
 	         .width(`${this.width1}`)
 	         .height(700)
 	         .backgroundColor('#FFFAFA')
 	     }
 	   }
 	 }