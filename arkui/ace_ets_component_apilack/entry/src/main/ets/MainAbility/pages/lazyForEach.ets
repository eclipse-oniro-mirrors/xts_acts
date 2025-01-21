/**
 * Copyright (c) 2022 Shenzhen Kaihong Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import events_emitter from '@ohos.events.emitter';
import Log from '../common/Log.ets';

class BasicDataSource implements IDataSource {
  private listeners: DataChangeListener[] = []

  public totalCount(): number {
    return 0
  }
  public getData(index: number): any {
    return undefined
  }

  registerDataChangeListener(listener: DataChangeListener): void {
    if (this.listeners.indexOf(listener) < 0) {
      console.info('add listener')
      this.listeners.push(listener)
    }
  }
  unregisterDataChangeListener(listener: DataChangeListener): void {
    const pos = this.listeners.indexOf(listener);
    if (pos >= 0) {
      console.info('remove listener')
      this.listeners.splice(pos, 1)
    }
  }

  notifyDataReload(): void {
    this.listeners.forEach(listener => {
      listener.onDataReloaded()
    })
  }
  notifyDataAdd(index: number): void {
    this.listeners.forEach(listener => {
      listener.onDataAdd(index)
    })
  }
  notifyDataChange(index: number): void {
    this.listeners.forEach(listener => {
      listener.onDataChange(index)
    })
  }
  notifyDataDelete(index: number): void {
    this.listeners.forEach(listener => {
      listener.onDataDelete(index)
    })
  }
  notifyDataMove(from: number, to: number): void {
    this.listeners.forEach(listener => {
      listener.onDataMove(from, to)
    })
  }
}

class MyDataSource extends BasicDataSource {
  private dataArray: string[] = ['/path/image0']

  public totalCount(): number {
    return this.dataArray.length
  }
  public getData(index: number): any {
    return this.dataArray[index]
  }

  public addData(index: number, data: string): void {
    this.dataArray.splice(index, 0, data)
    var datatest=this.dataArray.length
    console.info('lenghth = '+ datatest)
    for(var i = 0; i<datatest; i++){
      console.info('after adding: '+ this.dataArray[i])
    }
    this.notifyDataAdd(index)
    this.notifyDataChange(index)
  }

  public pushData(data: string): void {
    this.dataArray.push(data)
    this.notifyDataAdd(this.dataArray.length - 1)
    var datatest=this.dataArray.length
    console.info('lenghth = '+ datatest)
    for(var i = 0; i<datatest; i++){
      console.info('after adding: '+ this.dataArray[i])
    }
  }

  public moveData(index1:number,index2:number):void{
    if(index1 < index2){
      var temp = this.dataArray[index1]
      for(var i = index1; i  < index2 ;i++){
        this.dataArray[i] = this.dataArray[i+1]
      }
      this.dataArray[index2] = temp

      for(var j = 0 ; j < this.dataArray.length ; j++){
        console.info('after moving :' + this.dataArray[j])
      }
    }
    else if (index1 > index2){
      var temp = this.dataArray[index1]
      for(var i = index1 ; i > index2; i--){
        this.dataArray[i] = this.dataArray[i-1]
      }
      this.dataArray[index2] = temp

      for(var j = 0 ; j < this.dataArray.length ; j++){
        console.info('after moving :' + this.dataArray[j])
      }
    }
    this.notifyDataMove(index1,index2)
  }

  public popData(): void {
    this.dataArray.pop()
    this.notifyDataDelete(this.dataArray.length)
    var datatest=this.dataArray.length
    console.info('lenghth = '+ datatest)
    for(var i = 0; i<datatest; i++){
      console.info('after deleting: '+ this.dataArray[i])
    }
  }

  public changeData(index: number): void {
    this.dataArray[index] = 'apple'
    var datatest=this.dataArray.length
    console.info('lenghth = '+ datatest)
    for(var i = 0; i<datatest; i++){
      console.info('after changing: '+ this.dataArray[i])
    }
    this.notifyDataChange(index)
  }
}

const TAG = 'ets_apiLack_add';

@Entry
@Component
struct LazyForEachOnDataAdd {
  private data: MyDataSource = new MyDataSource()
  private scroller: Scroller = new Scroller()
  @State result_101:boolean = true
  @State result_102:boolean = true
  @State result_103:boolean = true
  @State result_104:boolean = true

  aboutToAppear() {
    Log.showInfo(TAG, `aboutToAppear LazyForEachOnDataAdd start`)
  }

  aboutToDisappear() {
    Log.showInfo(TAG, `aboutToDisAppear LazyForEachOnDataAdd end`)
  }

  build() {

    Column() {
      Stack({ alignContent: Alignment.End }) {
        Scroll(this.scroller) {
          Flex({
            direction: FlexDirection.Column,
            alignItems: ItemAlign.Start,
            justifyContent: FlexAlign.SpaceBetween
          }) {

            Text("lazyForEach-OnDataAdd")
              .width(300)
              .height(70)
              .fontSize(20)
              .opacity(1)
              .align(Alignment.TopStart)
              .fontColor(0xCCCCCC)
              .lineHeight(25)
              .border({ width: 1 })
              .padding(10)
              .textAlign(TextAlign.Center)
              .textOverflow({ overflow: TextOverflow.None })
              .key("onDataAddText")

            List({ space: 3 }) {
              LazyForEach(this.data, (item: string) => {
                ListItem() {
                  Row() {
                    Image(item).width("30%").height(50)
                    Text(item).fontSize(20).margin({ left: 10 })
                  }.margin({ left: 10, right: 10 })
                }
                .key("listItemOne")
                .onClick(() => {
                  try{
                    this.data.pushData('/path/image' + this.data.totalCount())
                    console.info("this.data.totalCount() is :" + this.data.totalCount())
                  }catch(err){
                    this.result_101 = false
                    console.info("LazyForEachOnDataAdd_101 onClick emit action err: " + JSON.stringify(err.message))
                  }

                  try {
                    var backData1 = {
                      data: {
                        "result1": this.result_101,
                      }
                    }
                    let backEvent1 = {
                      eventId: 60212,
                      priority: events_emitter.EventPriority.LOW
                    }
                    console.info("LazyForEachOnDataAdd_101 onClick start to emit action")
                    events_emitter.emit(backEvent1, backData1)
                  } catch (err) {
                    console.info("LazyForEachOnDataAdd_101 onClick emit action err: " + JSON.stringify(err.message))
                  }
                })
              }, item => item)
            }

            Text("lazyForEach-OnDataMove")
              .width(300)
              .height(70)
              .fontSize(20)
              .opacity(1)
              .align(Alignment.TopStart)
              .fontColor(0xCCCCCC)
              .lineHeight(25)
              .border({ width: 1 })
              .padding(10)
              .textAlign(TextAlign.Center)
              .textOverflow({ overflow: TextOverflow.None })
              .key("onDataMoveText")
            
            List({ space: 3 }) {
              LazyForEach(this.data, (item: string) => {
                ListItem() {
                  Row() {
                    Image(item).width("30%").height(50)
                    Text(item).fontSize(20).margin({ left: 10 })
                  }.margin({ left: 10, right: 10 })
                }
                .key("listItemTwo")
                .onClick(() => {
                  try{
                    this.data.moveData(3, 1)
                  }catch(err){
                    this.result_102 = false
                    console.info("LazyForEachOnDataAdd_102 onClick emit action err: " + JSON.stringify(err.message))
                  }

                  try {
                    var backData2 = {
                      data: {
                        "result2": this.result_102,
                      }
                    }
                    let backEvent2 = {
                      eventId: 60213,
                      priority: events_emitter.EventPriority.LOW
                    }
                    console.info("LazyForEachOnDataAdd_102 onClick start to emit action")
                    events_emitter.emit(backEvent2, backData2)
                  } catch (err) {
                    console.info("LazyForEachOnDataAdd_102 onClick emit action err: " + JSON.stringify(err.message))
                  }
                })
              }, item => item)
            }

            Text("lazyForEach-OnDataDelete")
              .width(300)
              .height(70)
              .fontSize(20)
              .opacity(1)
              .align(Alignment.TopStart)
              .fontColor(0xCCCCCC)
              .lineHeight(25)
              .border({ width: 1 })
              .padding(10)
              .textAlign(TextAlign.Center)
              .textOverflow({ overflow: TextOverflow.None })
              .key("onDataDeleteText")

            List({ space: 3 }) {
              LazyForEach(this.data, (item: string) => {
                ListItem() {
                  Row() {
                    Image(item).width("30%").height(50)
                    Text(item).fontSize(20).margin({ left: 10 })
                  }.margin({ left: 10, right: 10 })
                }
                .key("listItemThree")
                .onClick(() => {
                  try{
                    this.data.popData()
                  }catch(err){
                    this.result_103 = false
                    console.info("LazyForEachOnDataAdd_103 onClick emit action err: " + JSON.stringify(err.message))
                  }

                  try {
                    var backData3 = {
                      data: {
                        "result3": this.result_103,
                      }
                    }
                    let backEvent3 = {
                      eventId: 60214,
                      priority: events_emitter.EventPriority.LOW
                    }
                    console.info("LazyForEachOnDataAdd_103 onClick start to emit action")
                    events_emitter.emit(backEvent3, backData3)
                  } catch (err) {
                    console.info("LazyForEachOnDataAdd_103 onClick emit action err: " + JSON.stringify(err.message))
                  }

                })
              }, item => item)
            }

            Text("lazyForEach-OnDataChange")
              .width(300)
              .height(70)
              .fontSize(20)
              .opacity(1)
              .align(Alignment.TopStart)
              .fontColor(0xCCCCCC)
              .lineHeight(25)
              .border({ width: 1 })
              .padding(10)
              .textAlign(TextAlign.Center)
              .textOverflow({ overflow: TextOverflow.None })
              .key("onDataChangeText")

            List({ space: 3 }) {
              LazyForEach(this.data, (item: string) => {
                ListItem() {
                  Row() {
                    Image(item).width("30%").height(50)
                    Text(item).fontSize(20).margin({ left: 10 })
                  }.margin({ left: 10, right: 10 })
                }
                .key("listItemFour")
                .onClick(() => {
                  try{
                    this.data.changeData(2)
                  }catch(err){
                    this.result_104 = false
                    console.info("LazyForEachOnDataAdd_104 onClick emit action err: " + JSON.stringify(err.message))
                  }

                  try {
                    var backData4 = {
                      data: {
                        "result4": this.result_104,
                      }
                    }
                    let backEvent4 = {
                      eventId: 60215,
                      priority: events_emitter.EventPriority.LOW
                    }
                    console.info("LazyForEachOnDataAdd_104 onClick start to emit action")
                    events_emitter.emit(backEvent4, backData4)
                  } catch (err) {
                    console.info("LazyForEachOnDataAdd_104 onClick emit action err: " + JSON.stringify(err.message))
                  }
                })
              }, item => item)
            }
          }.width("100%").height("100%")
        }
      }
    }
  }
}

