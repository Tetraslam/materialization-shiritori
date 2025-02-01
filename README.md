# Materialization Shiritori - A VR Game for Hack@Brown 2025

## Overview

You're the big bad boss with the ability to add or remove anything from reality using your voice. Hordes of pesky heroes are attacking you, and you need to defend yourself so that you can continue to wreak havoc on the world.

## Tech Stack

- Godot
- OpenXR
- Vosk (STT)
- Meta Llama 3.1 8B Instruct (tool calling is good)
- Model fetching: Poly Pizza API (provides free downloads)
- Model creation: Mouad "If You Really Want Me To Make An RL Model I Can Be Sweaty" Tiahi
- Procedural enemy generation: group enemy types, spawn rate, health, damage, abilities by difficulty and pick randomly from the list + adaptive difficulty
- Navmesh AI for enemy pathfinding
- Hexgrad Kokoro (TTS)
- Object physics: Unity RigidBody + Gravity Scaling
- Oculus API for haptics
- All non-integrated APIs/libraries will be served on a FastAPI instance
