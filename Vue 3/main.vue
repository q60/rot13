<script setup lang="ts">
import { ref, computed } from "vue";

const a = "a".charCodeAt(0),
    z = "z".charCodeAt(0),
    A = "A".charCodeAt(0),
    Z = "Z".charCodeAt(0);

const input = ref("Hello World!");
const output = computed(() =>
    [...input.value]
        .map((c: string) => {
            let i: number = c.charCodeAt(0);
            if (a <= i && i <= z) i = ((i - a + 13) % 26) + a;
            else if (A <= i && i <= Z) i = ((i - A + 13) % 26) + A;
            return String.fromCharCode(i);
        })
        .join("")
);
</script>

<template>
    <label> Enter string to encode:</label> <input v-model="input" /> <br />
     Encoded string: {{ output }}
</template>
