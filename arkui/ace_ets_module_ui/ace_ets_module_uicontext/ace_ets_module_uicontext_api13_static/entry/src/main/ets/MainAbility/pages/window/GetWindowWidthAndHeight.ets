'use static';
/**
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

import { UIContext, Router } from '@ohos.arkui.UIContext';
import window from '@ohos.window';
import {
    Entry, Component,
    Column, ColumnOptions, Row,TextSelectableMode,
    Text, Button, FontWeight, ClickEvent, Margin, WidthBreakpoint, HeightBreakpoint,
} from '@ohos.arkui.component'
import { State,AppStorage } from '@ohos.arkui.stateManagement';
import common from  '@ohos.app.ability.common'


@Entry
@Component
struct Index {
    @State message:string = 'Hello World';
    @State widthBp: WidthBreakpoint = WidthBreakpoint.WIDTH_XS
    @State heightBp: HeightBreakpoint = HeightBreakpoint.HEIGHT_SM




    @State windowWidthBreakpoint: number = -1
    @State windowHeightBreakpoint: number = -1

    build(){
        Row(){
            Column(){
                Text(this.message)
                    .fontSize(30)
                    .fontWeight(FontWeight.Bold)
                Button('getWindowWidthBreakpoint').key('getWindowWidthBreakpointButton')
                    .onClick((e:ClickEvent)=>{
                        let uiContext:UIContext = this.getUIContext();
                            this.widthBp = uiContext.getWindowWidthBreakpoint();
                    }).margin({top:4} as Margin)

                Button('getWindowHeightBreakpoint').key('getWindowHeightBreakpointButton')
                    .onClick((e:ClickEvent)=>{
                        let uiContext:UIContext = this.getUIContext();
                        this.heightBp = uiContext.getWindowHeightBreakpoint();
                    }).margin({top:4} as Margin)

                Button('getWindowWidth').key('getWindowWidth')
                    .onClick((e:ClickEvent)=>{
                        let param = AppStorage.get<UIContext>('uiCOntext')!.getHostContext()! as common.BaseContext
                        let  promise = window.getLastWindow(param);
                        promise.then((mainWindow:window.Window) => {
                            let windowRect:window.Rect = mainWindow.getWindowProperties().windowRect;
                            let windowWidthVP:number = this.getUIContext().px2vp(windowRect.width);
                            let windowHeightVp:number = this.getUIContext().px2vp(windowRect.height);
                            let heightAndWidth = windowHeightVp/windowWidthVP;
                            if (windowWidthVP < 320) {
                                this.windowWidthBreakpoint = 0;
                            } else if(windowWidthVP >= 320 && windowWidthVP < 600) {
                                this.windowWidthBreakpoint = 1;
                            } else if(windowWidthVP >= 600 && windowWidthVP < 840) {
                                this.windowWidthBreakpoint = 2;
                            } else if(windowWidthVP >= 840 && windowWidthVP < 1440) {
                                this.windowWidthBreakpoint = 3;
                            } else if(windowWidthVP >= 1440) {
                                this.windowWidthBreakpoint = 4;
                            }

                            if (heightAndWidth < 0.8) {
                                this.windowHeightBreakpoint = 0
                            } else if(heightAndWidth >= 0.8 && heightAndWidth < 1.2) {
                                this.windowHeightBreakpoint = 1;
                            } else if(windowWidthVP >= 1.2) {
                                this.windowHeightBreakpoint = 2;
                            }

                        })
                    }).margin({top:4} as Margin)

                Text(this.windowWidthBreakpoint + '').key('windowWidthBreakpoint')
                Text(this.widthBp + '').key('widthBpValue')

                Text(this.heightBp + '').key('heightBpValue')
                Text(this.windowHeightBreakpoint + '').key('windowHeightBreakpoint')
            }
            .width('100%')
        }
        .height('100%')
    }
}