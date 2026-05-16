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
 
import { MultiNavPathStack } from '@ohos.arkui.advanced.MultiNavigation';

@Component
export struct PageDetail {
  @State message: string = 'PageDetail';
  @Consume('pageStack') pageStack: MultiNavPathStack;

  build() {
    NavDestination() {
      Column() {
        Scroll(){
          Column(){
            Text(this.message)
              .id('detailTextId')
              .fontSize(10)
              .height('5%')
            Button('removeByNamePageDetail')
              .height('5%')
              .onClick(() => {
                if (this.pageStack !== undefined && this.pageStack !== null) {
                  this.pageStack.removeByName('PageDetail');
                }
              })
              .id('removeByNamePageDetailId')
            Button('removeByIndexes135')
              .height('5%')
              .onClick(() => {
                if (this.pageStack !== undefined && this.pageStack !== null) {
                  this.pageStack.removeByIndexes([1,3,5]);
                }
              })
              .id('removeByIndexes135Id')
            Button('popToHome')
              .height('5%')
              .onClick(() => {
                if (this.pageStack !== undefined && this.pageStack !== null) {
                  this.pageStack.popToName('PageHome', true);
                }
              })
              .id('popToHomeId')
            Button('popToIndex1')
              .onClick(() => {
                if (this.pageStack !== undefined && this.pageStack !== null) {
                  this.pageStack.popToIndex(0, false);
                }
              }).height('5%')
              .id('popToIndex1Id')
            Button('popToIndex2')
              .onClick(() => {
                if (this.pageStack !== undefined && this.pageStack !== null) {
                  this.pageStack.popToIndex(0, 'testPop', true);
                }
              }).height('5%')
            Button('popToHome1')
              .height('5%')
              .onClick(() => {
                if (this.pageStack !== undefined && this.pageStack !== null) {
                  this.pageStack.popToName('PageHome', true);
                }
              })
              .id('popToHome1Id')
            Button('popToHome2')
              .height('5%')
              .onClick(() => {
                if (this.pageStack !== undefined && this.pageStack !== null) {
                  this.pageStack.popToName('PageHome','testPopToName',  true);
                }
              })
            Button('moveToTop')
              .height('5%')
              .onClick(() => {
                if (this.pageStack !== undefined && this.pageStack !== null) {
                  this.pageStack.moveToTop('PageHome', true);
                }
              })
              .id('moveToTopId')
            Button('moveIndexToTop')
              .height('5%')
              .onClick(() => {
                if (this.pageStack !== undefined && this.pageStack !== null) {
                  this.pageStack.moveIndexToTop(0, false);
                }
              })
            Button('moveIndexToTop-1')
              .height('5%')
              .onClick(() => {
                if (this.pageStack !== undefined && this.pageStack !== null) {
                  this.pageStack.moveIndexToTop(-1, false);
                }
              })
            Button('getAllPathName')
              .height('5%')
              .onClick(() => {
                if (this.pageStack !== undefined && this.pageStack !== null) {
                  let result = this.pageStack.getAllPathName();
                  console.log('multi test getAllPathName is: ', result.toString())
                  AppStorage.setOrCreate('allPathName', result.toString());
                }
              })
              .id('getAllPathNameId')
            Button('getParamByIndex')
              .height('5%')
              .onClick(() => {
                if (this.pageStack !== undefined && this.pageStack !== null) {
                  let result = this.pageStack.getParamByIndex(0);
                  console.log('multi test getParamByIndex: ' + result);
                  AppStorage.setOrCreate('indexParam', result); 
                }
              })
              .id('getParamByIndexId')
            Button('getParamByName')
              .height('5%')
              .onClick(() => {
                if (this.pageStack !== undefined && this.pageStack !== null) {
                  let result = this.pageStack.getParamByName('PageDetail');
                  console.log('multi test getParamByName: ' + result.toString());
                  AppStorage.setOrCreate('nameParam', result.toString());
                }
              })
              .id('getParamByNameId')
            Button('getIndexByName')
              .height('5%')
              .onClick(() => {
                if (this.pageStack !== undefined && this.pageStack !== null) {
                  let result = this.pageStack.getIndexByName('PageDetail');
                  console.log('multi test getIndexByName: ' + result?.length);
                  AppStorage.setOrCreate('indexLength', result?.length);
                }
              })
              .id('getIndexByNameId')
            Button('getSize')
              .height('5%')
              .onClick(() => {
                if (this.pageStack !== undefined && this.pageStack !== null) {
                  console.log('getSize: ' + this.pageStack.size());
                  AppStorage.setOrCreate('sizeNum', this.pageStack.size());
                }
              })
              .id('getSizeId')
            Button('disableAnimation')
              .height('5%')
              .onClick(() => {
                if (this.pageStack !== undefined && this.pageStack !== null) {
                  this.pageStack.disableAnimation(true);
                }
              })
            Button('enableAnimation')
              .height('5%')
              .onClick(() => {
                if (this.pageStack !== undefined && this.pageStack !== null) {
                  this.pageStack.disableAnimation(false);
                }
              })
            Button('setHomeWidthRange(20, 80)')
              .height('5%')
              .onClick(() => {
                if (this.pageStack !== undefined && this.pageStack !== null) {
                  this.pageStack.setHomeWidthRange(20, 80);
                }
              })
              .id('setHomeWidthRangeId')
          }
          .width('100%')
        }
        .width('100%')
        .height('100%')
      }
    }.hideTitleBar(true)
  }
}