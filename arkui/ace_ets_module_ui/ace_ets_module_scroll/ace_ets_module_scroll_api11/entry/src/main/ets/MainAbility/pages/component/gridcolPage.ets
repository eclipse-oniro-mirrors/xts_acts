
/**
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
import events_emitter from '@ohos.events.emitter';

class MyGridColOffsetModifier1 implements AttributeModifier<GridColAttribute> {
  isNum: number = 0

  applyNormalAttribute(instance: GridColAttribute): void {
    if (this.isNum === 0) {
      instance.gridColOffset(0);
    } else if (this.isNum === 1) {
      instance.gridColOffset(1);
    } else if (this.isNum === 2) {
      instance.gridColOffset({
        xs: 2,
        sm: 2,
        md: 2,
        lg: 2,
        xl: 2,
        xxl: 2
      });
    }
  }
}

class MyGridColSpanModifier1 implements AttributeModifier<GridColAttribute> {
  isNum: number = 0

  applyNormalAttribute(instance: GridColAttribute): void {
    if (this.isNum === 0) {
      instance.span(1)
    } else if (this.isNum === 1) {
      instance.span({
        xs: 2,
        sm: 2,
        md: 2,
        lg: 2,
        xl: 2,
        xxl: 2
      });
    }
  }
}

class MyGridColOrderModifier1 implements AttributeModifier<GridColAttribute> {
  isNum: number = 0

  applyNormalAttribute(instance: GridColAttribute): void {
    if (this.isNum === 0) {
      instance.order(1);
    } else if (this.isNum === 1) {
      instance.order(2);
    }
  }
}

class MyGridColOrderModifier2 implements AttributeModifier<GridColAttribute> {
  isNum: number = 0

  applyNormalAttribute(instance: GridColAttribute): void {
    if (this.isNum === 0) {
      instance.order(2);
    } else if (this.isNum === 1) {
      instance.order(1);
    }
  }
}

@Entry
@Component
struct GridColExample {
  @State modOffsetRed: MyGridColOffsetModifier1 = new MyGridColOffsetModifier1()
  @State modSpan: MyGridColSpanModifier1 = new MyGridColSpanModifier1()
  @State modOrder1: MyGridColOrderModifier1 = new MyGridColOrderModifier1()
  @State modOrder2: MyGridColOrderModifier2 = new MyGridColOrderModifier2()
  @State redOffset: number | GridColColumnOption = 0
  @State mspan: number | GridColColumnOption = 1
  @State morder1: number | GridColColumnOption = 1
  @State morder2: number | GridColColumnOption = 2
  @State currentBp: string = ''
  private stateChangCallBack = (eventData: events_emitter.EventData) => {
    if (eventData != null) {
      console.info("Gridcol page state change called:" + JSON.stringify(eventData));
      if (eventData.data!.gridColOffsetNum != null) {
        this.modOffsetRed.isNum = eventData.data!.gridColOffsetNum;
        //old test
        if (eventData.data!.gridColOffsetNum === 0) {
          this.redOffset = 0;
        } else if (eventData.data!.gridColOffsetNum === 1) {
          this.redOffset = 1;
        } else if (eventData.data!.gridColOffsetNum === 2) {
          this.redOffset = { xs: 1, sm: 2, md: 3 };
        }
      } else if (eventData.data!.spanNum != null) {
        this.modSpan.isNum = eventData.data!.spanNum;

        //old test
        if (eventData.data!.spanNum === 0) {
          this.mspan = 1;
        } else if (eventData.data!.spanNum === 1) {
          this.mspan = { xs: 1, sm: 2, md: 3 };
        }
      } else if (eventData.data!.orderNum != null) {
        this.modOrder1.isNum = eventData.data!.orderNum;
        this.modOrder2.isNum = eventData.data!.orderNum;

        //old test
        if (eventData.data!.orderNum === 0) {
          this.morder1 = 1;
          this.morder2 = 2;
        } else if (eventData.data!.orderNum === 1) {
          this.morder1 = 2;
          this.morder2 = 1;
        }
      }
    }
  }

  onPageShow() {
    console.info('gridcol page1 show called');
    let stateChangeEvent: events_emitter.InnerEvent = {
      eventId: 181,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(stateChangeEvent, this.stateChangCallBack);
    let stateChangeEvent2: events_emitter.InnerEvent = {
      eventId: 182,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(stateChangeEvent2, this.stateChangCallBack);
    let stateChangeEvent3: events_emitter.InnerEvent = {
      eventId: 183,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(stateChangeEvent3, this.stateChangCallBack);
    let stateChangeEvent4: events_emitter.InnerEvent = {
      eventId: 184,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(stateChangeEvent4, this.stateChangCallBack);
    let stateChangeEvent5: events_emitter.InnerEvent = {
      eventId: 185,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(stateChangeEvent5, this.stateChangCallBack);
  }

  build() {
    Column() {
      GridRow({
        columns: 5,
        gutter: { x: 5, y: 10 },
        breakpoints: { value: ["400vp", "600vp", "800vp"],
          reference: BreakpointsReference.WindowSize },
        direction: GridRowDirection.Row
      }) {
        GridCol({ span: 1 }) {
          Row() {
            Text('Red')
          }.width("100%").height("20vp")
        }.borderColor(Color.Red).borderWidth(2).key('keykeyoffset')
        // .gridColOffset(this.redOffset)
        .attributeModifier(this.modOffsetRed)

        GridCol({ span: 1 }) {
          Row() {
            Text('Orange')
          }.width("100%").height("20vp")
        }.borderColor(Color.Orange).borderWidth(2).key('keykeyspan')
        // .span(this.mspan)
        .attributeModifier(this.modSpan)

        GridCol() {
          Row() {
            Text('Red')
          }.width("100%").height("20vp")
        }.borderColor(Color.Red).borderWidth(2).key('keykeyorder1')
        // .order(this.morder1)
        .attributeModifier(this.modOrder1)

        GridCol() {
          Row() {
            Text('Orange')
          }.width("100%").height("20vp")
        }.borderColor(Color.Orange).borderWidth(2).key('keykeyorder2')
        // .order(this.morder2)
        .attributeModifier(this.modOrder2)
      }
      .width("100%")
      .height("100%")
      .border({ color: '#880606', width: 2 })
      .padding({ top: 20, bottom: 20, left: 5, right: 5 })
      .onBreakpointChange((breakpoint) => {
        this.currentBp = breakpoint
      })
    }.width('90%')
  }
}