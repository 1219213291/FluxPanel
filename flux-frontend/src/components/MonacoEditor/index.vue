<template>
  <div ref="editorContainer":style="{
      height: typeof height === 'number' ? `${height}px` : height,
      width: typeof width === 'number' ? `${width}px` : width
    }"  ></div>
</template>

<script setup>
import * as monaco from 'monaco-editor'
import { ref, onMounted, onBeforeUnmount, watch } from 'vue'
// 定义 props
const props = defineProps({
  modelValue: {
    type: String,
    default: ''
  },
  language: {
    type: String,
    default: 'python'
  },
  width: {
    type: [String, Number],
    default: '100%'
  },
  height: {
    type: [String, Number],
    default: '300px'
  }
})

// 定义 emit
const emit = defineEmits(['update:modelValue', 'change'])

const editorContainer = ref(null)
let editor = null

onMounted(() => {
  // 定义 Monarch 语法高亮
  // 定义 Python 关键字列表

  if (props.language==='python'){
    const pythonKeywords = [
      'and', 'as', 'assert', 'break', 'class', 'continue', 'def', 'del', 'elif', 'else',
      'except', 'finally', 'for', 'from', 'global', 'if', 'import', 'in', 'is', 'lambda',
      'nonlocal', 'not', 'or', 'pass', 'raise', 'return', 'try', 'while', 'with', 'yield'
    ];
    const builtinFunctions = [ // 添加内置函数
          'print', 'len', 'range', 'type', 'int', 'str', 'list', 'dict', 'set', 'tuple',
          'open', 'input', 'sum', 'max', 'min', 'abs', 'round', 'sorted', 'zip', 'map'
        ]


// 注册 Python 语言
    monaco.languages.register({ id: 'python' });
    monaco.languages.registerCompletionItemProvider('python', {
      provideCompletionItems: (model, position) => {
        const suggestions = [
          // 内置函数
          ...builtinFunctions.map(func => ({
            label: func,
            kind: monaco.languages.CompletionItemKind.Function,
            insertText: func,
            documentation: `Built-in function: ${func}`,
          })),
          // 标准库模块
          ...['os', 'sys', 'math', 'random', 'datetime', 'json'].map(module => ({
            label: module,
            kind: monaco.languages.CompletionItemKind.Module,
            insertText: module,
            documentation: `Standard library module: ${module}`,
          })),
          // 第三方库（示例）
          ...['numpy', 'pandas', 'requests', 'flask'].map(lib => ({
            label: lib,
            kind: monaco.languages.CompletionItemKind.Module,
            insertText: lib,
            documentation: `Third-party library: ${lib}`,
          })),
            ...pythonKeywords.map(keyword => ({
          label: keyword,
          kind: monaco.languages.CompletionItemKind.Keyword,
          insertText: keyword
        })),
        ];
        return { suggestions };
      },
    });}


  // 创建编辑器实例
  editor = monaco.editor.create(editorContainer.value, {
    value: props.modelValue,
    language: props.language,
    minimap: {
      enabled: true,
    },
    colorDecorators: true,
    readOnly: false,
    theme: "vs-dark",
    automaticLayout: true, // 自动调整布局
    contextmenu: true,
    renderLineHighlight: 'gutter',
    wordBasedSuggestions: true,
    colors: {
      'editor.background': '#1E1E1E',
      'editor.foreground': '#D4D4D4',
      'editorCursor.foreground': '#FFFFFF',
      'editor.lineHighlightBackground': '#2A2A2A',
    },
    fontFamily: 'Consolas, "Courier New", monospace', // 设置字体族
  })
  // 监听编辑器内容变化
  editor.onDidChangeModelContent(() => {
    const value = editor.getValue()
    emit('update:modelValue', value)
    emit('change', value)
  })
})

// 监听 props 变化
watch(() => props.modelValue, (newValue) => {
  if (editor && newValue !== editor.getValue()) {
    console.log(newValue)
    editor.setValue(newValue)
  }
})

watch(() => props.language, (newValue) => {
  if (editor) {
    monaco.editor.setModelLanguage(editor.getModel(), newValue)
  }
})

// 组件卸载时清理编辑器实例
onBeforeUnmount(() => {
  if (editor) {

    editor.dispose()
  }
})
</script>

<style scoped>
/* 可选：添加一些样式确保编辑器容器正确显示 */
</style>