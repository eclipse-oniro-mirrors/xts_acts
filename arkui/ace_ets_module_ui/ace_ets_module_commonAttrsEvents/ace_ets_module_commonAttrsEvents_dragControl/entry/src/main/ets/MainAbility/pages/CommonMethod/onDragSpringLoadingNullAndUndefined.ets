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

@Entry
@Component
struct CommonMethodOnDragSpringLoadingNullAndUndefined {
  @State targetText: string = 'Drag Text';
  @State state: number = 0;
  @State currentNotifySequence: number = 0;
  @State config: DragSpringLoadingConfiguration = {
    stillTimeLimit: 0,
    updateInterval: 0,
    updateNotifyCount: 0,
    updateToFinishInterval: 0
  };

  build() {
    Row() {
      Column() {
        Text('start Drag')
          .height('5%')
          .backgroundColor('#008888')
        Image($r('app.media.app_icon'))
          .id('ori_image')
          .width('30%')
          .height('10%')
          .id('image')
          .draggable(true)
        Text('当前状态是： ' + this.state)
          .width('100%')
          .height('10%')
          .id('text1')
        Text('当前通知序列是： ' + this.currentNotifySequence)
          .width('100%')
          .height('10%')
          .id('text2')
      }
      .width('45%')
      .height('100%')

      Column() {
        Column() {
          Text('Drag Target Area')
            .width('100%')
            .height('5%')
            .backgroundColor('#008888')
            .id('text')
        }
        .width('45%')
        .height('20%')
        .onDragSpringLoading(null, this.config)
        .id('column1')
        .backgroundColor(Color.Grey)

        Column() {
          Text('Drag Target Area')
            .width('100%')
            .height('5%')
            .backgroundColor('#008888')
            .id('text')
        }
        .width('45%')
        .height('20%')
        .onDragSpringLoading(undefined, this.config)
        .id('column2')
        .backgroundColor(Color.Grey)

        Column() {
          Text('Drag Target Area')
            .width('100%')
            .height('5%')
            .backgroundColor('#008888')
            .id('text')
        }
        .width('45%')
        .height('20%')
        .onDragSpringLoading((context: SpringLoadingContext) => {
          this.state = context.state;
          this.currentNotifySequence = context.currentNotifySequence;
        }, null)
        .id('column3')
        .backgroundColor(Color.Grey)

        Column() {
          Text('Drag Target Area')
            .width('100%')
            .height('5%')
            .backgroundColor('#008888')
            .id('text')
        }
        .width('45%')
        .height('20%')
        .onDragSpringLoading((context: SpringLoadingContext) => {
          this.state = context.state;
          this.currentNotifySequence = context.currentNotifySequence;
        }, undefined)
        .id('column4')
        .backgroundColor(Color.Grey)
      }
    }
    .height('100%').width('100%')
  }
}
