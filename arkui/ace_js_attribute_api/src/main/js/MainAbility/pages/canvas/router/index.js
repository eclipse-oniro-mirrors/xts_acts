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

export default {
    data: {
        ctx: '',
    },
    onShow() {
        this.ctx = this.$refs.canvas.getContext("2d");
        this.ctx.fillStyle = "red"
        this.ctx.fillRect(200, 150, 200, 200);
    },
    save() {
        // 画笔储存
        this.ctx.save();
        console.info('save succeed')
    },
    clear() {
        this.ctx.clearRect(0, 0, 600, 500);
        // 该变画笔颜色
        this.ctx.fillStyle = "#2133d2";
    },
    restore() {
        this.ctx.beginPath();
        // 画笔恢复
        this.ctx.restore();
        this.ctx.fillRect(200, 150, 200, 200);
    },
    getLineDash() {
        this.ctx.arc(100, 75, 50, 0, 6.28);
        this.ctx.setLineDash([10, 20]);
        this.ctx.stroke();
        var info = this.ctx.getLineDash();
        console.info('getLineDash：' + info)
    }
}



