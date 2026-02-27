<template>
  <Head title="Home" />

  <div
    class="min-h-screen bg-neutral-950 text-neutral-200 font-sans selection:bg-accent-muted selection:text-white overflow-x-hidden"
  >
    <!-- Noise texture overlay -->
    <div
      class="fixed inset-0 pointer-events-none z-50 opacity-[0.03]"
      :style="{ backgroundImage: noiseUrl }"
    ></div>

    <!-- Hero -->
    <section class="relative min-h-screen flex items-center overflow-hidden">
      <!-- Background glow -->
      <div
        class="absolute top-1/2 left-1/2 -translate-x-1/2 -translate-y-1/2 w-[600px] h-[400px] rounded-full bg-accent/[0.04] blur-[120px] pointer-events-none"
      ></div>

      <!-- Subtle grid lines -->
      <div class="absolute inset-0 pointer-events-none overflow-hidden">
        <div
          class="absolute top-0 left-[20%] w-px h-full bg-neutral-800/30"
        ></div>
        <div
          class="absolute top-0 left-[80%] w-px h-full bg-neutral-800/30"
        ></div>
      </div>

      <div class="relative w-full max-w-6xl mx-auto px-6 md:px-12">
        <div class="grid grid-cols-1 md:grid-cols-12 gap-6 md:gap-10 items-end">
          <!-- Main content -->
          <div class="md:col-span-8">
            <div
              class="inline-flex items-center gap-2.5 mb-8 fade-up"
              style="animation-delay: 0ms"
            >
              <div
                class="w-1.5 h-1.5 rounded-full bg-accent animate-pulse"
              ></div>
              <span
                class="font-mono text-[11px] tracking-[0.2em] uppercase text-neutral-500"
              >
                Available for work
              </span>
            </div>

            <h1
              class="font-serif text-5xl md:text-6xl lg:text-7xl font-medium text-white leading-[0.95] mb-5 fade-up"
              style="animation-delay: 80ms"
            >
              {{ about.name }}<span class="text-accent">.</span>
            </h1>

            <p
              class="text-lg md:text-xl text-neutral-300 font-light leading-snug mb-2 fade-up"
              style="animation-delay: 160ms"
            >
              {{ about.title }}
            </p>
            <p
              class="text-sm text-neutral-500 max-w-md leading-relaxed mb-8 fade-up"
              style="animation-delay: 240ms"
            >
              {{ about.summary }}
            </p>

            <div
              class="flex items-center gap-6 fade-up"
              style="animation-delay: 320ms"
            >
              <Link
                href="/posts"
                class="group inline-flex items-center gap-2.5 px-5 py-2.5 text-sm font-medium text-neutral-950 bg-accent hover:bg-accent-light transition-colors duration-300 rounded"
              >
                Read the blog
                <span
                  class="inline-block transition-transform duration-300 group-hover:translate-x-1"
                  >&rarr;</span
                >
              </Link>
              <a
                href="mailto:joeytongay@gmail.com"
                class="group inline-flex items-center gap-2 text-sm text-neutral-400 hover:text-white transition-colors duration-300"
              >
                <span
                  class="w-4 h-px bg-neutral-600 group-hover:w-6 group-hover:bg-accent transition-all duration-300"
                ></span>
                Contact
              </a>
            </div>
          </div>

          <!-- Side stats -->
          <div
            class="md:col-span-4 md:border-l md:border-neutral-800 md:pl-8 fade-up"
            style="animation-delay: 400ms"
          >
            <div class="flex md:flex-col gap-8">
              <div>
                <span
                  class="block font-serif text-5xl text-white leading-none"
                  >{{ about.years_experience }}</span
                >
                <span
                  class="font-mono text-[10px] tracking-[0.15em] uppercase text-neutral-500 mt-1.5 block"
                  >Years Engineering</span
                >
              </div>
              <div>
                <span
                  class="block font-serif text-5xl text-white leading-none"
                  >{{ about.years_leading }}</span
                >
                <span
                  class="font-mono text-[10px] tracking-[0.15em] uppercase text-neutral-500 mt-1.5 block"
                  >Years Leading</span
                >
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>

    <!-- Tech Stack -->
    <section class="border-t border-neutral-800/60 bg-neutral-900/30">
      <div class="max-w-6xl mx-auto px-6 md:px-12 py-12">
        <p
          class="font-mono text-[11px] tracking-[0.2em] uppercase text-neutral-600 mb-6"
        >
          Technologies
        </p>

        <div
          class="grid grid-cols-2 sm:grid-cols-3 md:grid-cols-5 gap-px bg-neutral-800/40"
        >
          <div
            v-for="skill in about.skills"
            :key="skill"
            class="group bg-neutral-950 hover:bg-neutral-900 px-4 py-5 text-center transition-all duration-300 cursor-default"
          >
            <span
              class="text-sm text-neutral-400 group-hover:text-accent transition-colors duration-300"
            >
              {{ skill }}
            </span>
          </div>
        </div>
      </div>
    </section>

    <!-- Recent Posts -->
    <section class="relative border-t border-neutral-800/60">
      <div
        class="absolute bottom-0 right-0 w-[300px] h-[300px] rounded-full bg-accent/[0.02] blur-[80px] pointer-events-none"
      ></div>

      <div class="relative max-w-6xl mx-auto px-6 md:px-12 py-14">
        <div class="flex items-end justify-between mb-8">
          <div>
            <p
              class="font-mono text-[11px] tracking-[0.2em] uppercase text-neutral-600 mb-2"
            >
              Recent Writing
            </p>
            <h2 class="font-serif text-2xl md:text-3xl text-white">
              From the blog
            </h2>
          </div>
          <Link
            href="/posts"
            class="group hidden md:inline-flex items-center gap-2 text-sm text-neutral-500 hover:text-accent transition-colors duration-300"
          >
            View all
            <span
              class="inline-block transition-transform duration-300 group-hover:translate-x-1"
              >&rarr;</span
            >
          </Link>
        </div>

        <div v-if="recent_posts.length > 0">
          <Link
            v-for="(post, index) in recent_posts"
            :key="post.slug"
            :href="`/posts/${post.slug}`"
            class="group relative block py-6 border-t border-neutral-800/60 last:border-b last:border-neutral-800/60"
          >
            <!-- Hover accent bar -->
            <div
              class="absolute left-0 top-0 bottom-0 w-px bg-transparent group-hover:bg-accent transition-colors duration-500"
            ></div>

            <div
              class="flex items-start gap-5 pl-0 group-hover:pl-4 transition-all duration-500"
            >
              <!-- Post number -->
              <span
                class="hidden md:block font-mono text-xs text-neutral-700 mt-1 shrink-0"
              >
                {{ String(index + 1).padStart(2, "0") }}
              </span>

              <div class="flex-1 min-w-0">
                <div
                  class="flex flex-col md:flex-row md:items-baseline md:justify-between gap-1 md:gap-8"
                >
                  <h3
                    class="text-base md:text-lg font-medium text-neutral-200 group-hover:text-white transition-colors duration-300"
                  >
                    {{ post.title }}
                  </h3>
                  <div
                    class="flex items-center gap-3 text-xs font-mono text-neutral-600 shrink-0"
                  >
                    <span>{{ post.authored_on }}</span>
                    <span class="w-1 h-1 rounded-full bg-neutral-700"></span>
                    <span>{{ post.reading_time }} min</span>
                  </div>
                </div>
                <p
                  class="text-sm text-neutral-500 mt-2 max-w-2xl leading-relaxed line-clamp-2 group-hover:text-neutral-400 transition-colors duration-300"
                >
                  {{ post.excerpt }}
                </p>
              </div>
            </div>
          </Link>
        </div>

        <div
          v-else
          class="border border-neutral-800/60 rounded py-12 text-center"
        >
          <p class="text-neutral-600 font-mono text-sm">
            No posts yet — check back soon.
          </p>
        </div>

        <Link
          href="/posts"
          class="md:hidden inline-flex items-center gap-2 text-sm text-neutral-500 hover:text-accent transition-colors duration-300 mt-6"
        >
          View all posts &rarr;
        </Link>
      </div>
    </section>

    <!-- Footer -->
    <footer class="border-t border-neutral-800/60 bg-neutral-950">
      <div class="max-w-6xl mx-auto px-6 md:px-12 py-10">
        <div
          class="flex flex-col md:flex-row items-start md:items-center justify-between gap-6"
        >
          <div>
            <span class="font-serif text-base text-white">{{
              about.name
            }}</span>
            <p class="text-xs text-neutral-600 mt-0.5">{{ about.title }}</p>
          </div>
          <div class="flex items-center gap-6">
            <a
              href="mailto:joeytongay@gmail.com"
              class="text-xs font-mono tracking-wider uppercase text-neutral-500 hover:text-accent transition-colors duration-300"
            >
              Email
            </a>
            <Link
              href="/posts"
              class="text-xs font-mono tracking-wider uppercase text-neutral-500 hover:text-accent transition-colors duration-300"
            >
              Blog
            </Link>
          </div>
        </div>
        <div class="mt-8 pt-6 border-t border-neutral-800/30">
          <span class="font-mono text-[10px] text-neutral-700"
            >&copy; {{ new Date().getFullYear() }}</span
          >
        </div>
      </div>
    </footer>
  </div>
</template>

<script setup lang="ts">
import { Link, Head } from "@inertiajs/vue3";
import type { AboutInfo, BlogPostPreview } from "../../models";

interface Props {
  about: AboutInfo;
  recent_posts: BlogPostPreview[];
}

const { about, recent_posts } = defineProps<Props>();

// Inline SVG noise texture
const noiseUrl = `url("data:image/svg+xml,%3Csvg viewBox='0 0 256 256' xmlns='http://www.w3.org/2000/svg'%3E%3Cfilter id='n'%3E%3CfeTurbulence type='fractalNoise' baseFrequency='0.9' numOctaves='4' stitchTiles='stitch'/%3E%3C/filter%3E%3Crect width='100%25' height='100%25' filter='url(%23n)'/%3E%3C/svg%3E")`;
</script>

<style scoped>
.fade-up {
  opacity: 0;
  transform: translateY(16px);
  animation: fadeUp 0.8s cubic-bezier(0.16, 1, 0.3, 1) forwards;
}

@keyframes fadeUp {
  to {
    opacity: 1;
    transform: translateY(0);
  }
}
</style>
