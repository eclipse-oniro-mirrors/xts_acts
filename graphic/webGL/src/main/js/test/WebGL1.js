/*
 * Copyright (C) 2023 Huawei Device Co., Ltd.
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
export function checkError(gl, err) {
    let error;
    if (err) {
        error = err;
    }
    else {
        error = gl.getError();
    }
    switch (error) {
        case gl.NO_ERROR:
            console.info("webgltest checkError:NO_ERROR code:", error);
            break;
        case gl.INVALID_ENUM:
            console.info("webgltest checkError:INVALID_ENUM code:", error);
            break;
        case gl.INVALID_VALUE:
            console.info("webgltest checkError:INVALID_VALUE code:", error);
            break;
        case gl.INVALID_OPERATION:
            console.info("webgltest checkError:INVALID_OPERATION code:", error);
            break;
        case gl.INVALID_FRAMEBUFFER_OPERATION:
            console.info("webgltest checkError:INVALID_FRAMEBUFFER_OPERATION code:", error);
            break;
        case gl.OUT_OF_MEMORY:
            console.info("webgltest checkError:OUT_OF_MEMORY code:", error);
            break;
        case gl.CONTEXT_LOST_WEBGL:
            console.info("webgltest checkError:CONTEXT_LOST_WEBGL code:", error);
            break;
        default:
            console.info("webgltest checkError:Unknow Error code:", error);
            break;
    }
    return error;
}
export function wait(ms) {
    return new Promise((resolve, reject) => {
        setTimeout(() => {
            console.log("Done waiting");
            resolve(ms);
        }, ms);
    });
}
export function createProgram(gl, vSource, fSource, beforeLink) {
    let createShader = (gl, type, source) => {
        let shader = gl.createShader(type); //创建顶点着色器
        if (shader == null) {
            console.log('unable to create shader');
            return null;
        }
        gl.shaderSource(shader, source); //设置着色器代码
        gl.compileShader(shader); //编译
        let shaderParameter = gl.getShaderParameter(shader, gl.COMPILE_STATUS);
        if (!shaderParameter) { //如果编译失败
            let error = gl.getShaderInfoLog(shader);
            console.log('failed to compile shader: ' + error);
            gl.deleteShader(shader); //删除着色器
            return null;
        }
        return shader;
    };
    let vertexShader = createShader(gl, gl.VERTEX_SHADER, vSource);
    let fragmentShader = createShader(gl, gl.FRAGMENT_SHADER, fSource);
    if (!vertexShader || !fragmentShader) {
        console.log('failed to link program');
        return null;
    }
    let program = gl.createProgram();
    if (!program) {
        console.log('failed to link program');
        return null;
    }
    gl.attachShader(program, vertexShader);
    gl.attachShader(program, fragmentShader);
    if (beforeLink && beforeLink instanceof Function) {
        beforeLink(program);
    }
    gl.linkProgram(program);
    let linked = gl.getProgramParameter(program, gl.LINK_STATUS);
    if (!linked) {
        let error = gl.getProgramInfoLog(program);
        console.log('failed to link program: ' + error);
        gl.deleteProgram(program);
        gl.deleteShader(fragmentShader);
        gl.deleteShader(vertexShader);
        return null;
    }
    gl.useProgram(program);
    gl.program = program;
    return {
        program, vertexShader, fragmentShader
    };
}
